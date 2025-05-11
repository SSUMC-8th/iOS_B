//
//  KakaoLoginService.swift
//  Starbucks
//
//  Created by 바견규 on 5/9/25.
//

import Alamofire
import SwiftUI

// 🔹 카카오 Access Token 응답 모델
struct KakaoAccessTokenResponse: Codable {
    let access_token: String
    let refresh_token: String
    
    enum CodingKeys: String, CodingKey {
        case access_token
        case refresh_token
    }
}

// 🔹 카카오 사용자 정보 모델
struct KakaoUserInfo: Codable {
    let id: Int
    let properties: Properties
    let kakao_account: KakaoAccount?
    
    struct Properties: Codable {
        let nickname: String?
        let profile_image: String?
        let thumbnail_image: String?
    }
    
    struct KakaoAccount: Codable {
        let email: String?
        let profile: Profile?
        
        struct Profile: Codable {
            let nickname: String?
            let profile_image_url: String?
        }
    }
}

class KakaoLoginService: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var userInfo: KakaoUserInfo?

    private let authURL = "https://kauth.kakao.com/oauth/authorize"
    private let authToken = "https://kauth.kakao.com/oauth/token"
    private let userInfoURL = "https://kapi.kakao.com/v2/user/me"
    
    // 🔹 REST API 키
    private let clientID = "5fe90da54663d6e5db5632551164ee46"
    private let redirectURI = "http://localhost:8080/callback"
    
    // 🔹 액세스 토큰
    private var accessToken: String?

    // 🔹 1️⃣ 카카오 로그인 요청
    func requestLogin() {
        let url = "\(authURL)?client_id=\(clientID)&redirect_uri=\(redirectURI)&response_type=code"
        if let loginURL = URL(string: url) {
            UIApplication.shared.open(loginURL)
            print("로그인 요청 성공")
        }
    }

    // 🔹 2️⃣ 인증 코드로 액세스 토큰 받기
    func fetchAccessToken(authCode: String) {
        let parameters: [String: Any] = [
            "grant_type": "authorization_code",
            "client_id": clientID,
            "redirect_uri": redirectURI,
            "code": authCode
        ]

        AF.request(authToken, method: .post, parameters: parameters, encoding: URLEncoding.httpBody)
            .validate()
            .responseDecodable(of: KakaoAccessTokenResponse.self) { response in
                switch response.result {
                case .success(let data):
                    print("✅ Access Token: \(data.access_token)")
                    self.accessToken = data.access_token
                    self.saveTokenToKeychain(token: data.access_token)
                    self.fetchUserInfo()
                case .failure(let error):
                    print("❌ Error: \(error.localizedDescription)")
                }
            }
    }

    // 🔹 3️⃣ 사용자 정보 요청
    func fetchUserInfo() {
        guard let token = accessToken else {
            print("❌ Access Token이 없습니다.")
            return
        }

        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]

        AF.request(userInfoURL, method: .get, headers: headers)
            .validate()
            .responseDecodable(of: KakaoUserInfo.self) { response in
                switch response.result {
                case .success(let userInfo):
                    print("✅ 사용자 정보 요청 성공: \(userInfo)")
                    self.userInfo = userInfo
                    self.isLoggedIn = true
                case .failure(let error):
                    print("❌ 사용자 정보 요청 실패: \(error.localizedDescription)")
                }
            }
    }
    
    // 🔹 4️⃣ 키체인에 액세스 토큰 저장
    func saveTokenToKeychain(token: String) {
        let keychainService = KeychainService()
        let kakaoService = "com.example.myapp.kakao"
        keychainService.savePasswordToKeychain(account: "kakaoAccessToken", service: kakaoService, password: token)
    }
}

extension URL {
    var queryParameters: [String: String]? {
        var params = [String: String]()
        URLComponents(url: self, resolvingAgainstBaseURL: false)?.queryItems?.forEach {
            params[$0.name] = $0.value
        }
        return params
    }
}
