//
//  LoginViewModel.swift
//  Starbucks
//
//  Created by 박현규 on 3/18/25.
//
import Foundation
import Combine
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var id: String = ""
    @Published var password: String = ""

    @Published var isLoggedIn: Bool = false  // 로그인 상태
    @Published var errorMessage: String?
    
    // KeychainService 인스턴스 생성
    private var keychainService = KeychainService()

    var isValid: Bool {
        !id.isEmpty && !password.isEmpty
    }
    
    // 앱 실행 시 자동 로그인 체크
    func autoLogin() {
        let service = "com.starbucks.login"

        // Keychain에서 저장된 아이디 불러오기
        if let storedId = keychainService.load(account: "123", service: service), // 사용자 ID도 Keychain에서 불러옴
           let storedPassword = keychainService.load(account: storedId, service: service) { // 비밀번호는 아이디에 맞게 가져옴
           
            // 저장된 아이디와 비밀번호로 로그인 처리
            id = storedId
            password = storedPassword
            
            if password == storedPassword {
                // 로그인 성공
                isLoggedIn = true
                errorMessage = nil
                print("자동 로그인 성공: 아이디 = \(id), 비밀번호 = \(password)")
            } else {
                // 비밀번호 불일치
                isLoggedIn = false
                errorMessage = "아이디 또는 비밀번호가 잘못되었습니다."
                print("로그인 실패: 비밀번호가 일치하지 않습니다.")
            }
        } else {
            // Keychain에 정보가 없다면 자동 로그인 실패
            isLoggedIn = false
            errorMessage = "아이디가 등록되지 않았습니다."
            print("로그인 실패: 아이디가 Keychain에 없습니다.")
        }
    }
    
    func login() {
            let service = "com.starbucks.login"  // 서비스 이름
            
            // Keychain에서 저장된 비밀번호 불러오기
            if let storedPassword = keychainService.load(account: id, service: service) {
                if password == storedPassword {
                    // 로그인 성공
                    isLoggedIn = true
                    errorMessage = nil
                    print("로그인 성공: 아이디 = \(id), 비밀번호 = \(password)")  // 로그인 성공 시 출력
                } else {
                    // 비밀번호 불일치
                    isLoggedIn = false
                    errorMessage = "아이디 또는 비밀번호가 잘못되었습니다."
                    print("로그인 실패: 비밀번호가 일치하지 않습니다.")  // 로그인 실패 시 출력
                }
            } else {
                // 아이디가 Keychain에 없는 경우
                isLoggedIn = false
                errorMessage = "아이디가 등록되지 않았습니다."
                print("로그인 실패: 아이디가 Keychain에 없습니다.")  // 아이디가 없는 경우 출력
            }
        }
    func logout() {
        id = ""
        password = ""
        isLoggedIn = false
        errorMessage = nil
    }
}
