//
//  SignupViewModel.swift
//  Starbucks
//
//  Created by 바견규 on 3/25/25.
//

import Foundation
import SwiftUI

class SignupViewModel: ObservableObject {
    @Published var showAlert: Bool = false  // ⚠️ Alert 표시 여부
    @Published var signupModel = SignupModel(nickname: "", id: "", password: "")

    // AppStorage로 닉네임 저장
    @AppStorage("user_nickname") var userStorageNickname: String = ""
    
    // KeychainService 인스턴스 생성
    private var keychainService = KeychainService()  // KeychainService 인스턴스를 생성
    
    // 회원가입 함수
    func signup() {
        // 아이디, 비밀번호, 닉네임이 모두 채워졌는지 확인
        if signupModel.id.isEmpty || signupModel.password.isEmpty || signupModel.nickname.isEmpty {
            showAlert = true // 값이 하나라도 비어 있으면 알림을 표시
        } else {
            // 비밀번호는 Keychain에 저장
            let service = "com.starbucks.login" // 서비스 이름 (예: 앱 이름)
            let id = signupModel.id // 사용자의 아이디
            let password = signupModel.password // 사용자의 비밀번호
            
            // 비밀번호를 Keychain에 저장
            let passwordStatus = keychainService.savePasswordToKeychain(account: id, service: service, password: password)
            
            if passwordStatus == errSecSuccess {
                print("비밀번호 저장 완료")
            } else {
                print("비밀번호 저장 실패")
            }

            // 닉네임은 AppStorage에 저장
            userStorageNickname = signupModel.nickname  // 닉네임 저장
            
            // 회원가입 성공 시 닉네임을 출력
            print("회원가입 성공, 닉네임: \(signupModel.nickname)")
        }
    }
}

