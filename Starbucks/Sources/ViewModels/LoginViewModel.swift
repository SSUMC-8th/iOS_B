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

    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String?

    // 저장된 사용자 정보 (UserDefaults 기반)
    @AppStorage("user_email") private var storedID: String = ""
    @AppStorage("user_password") private var storedPassword: String = ""

    var isValid: Bool {
        !id.isEmpty && !password.isEmpty
    }

    func login() {
        if id == storedID && password == storedPassword {
            isLoggedIn = true
            errorMessage = nil
        } else {
            isLoggedIn = false
            errorMessage = "아이디 또는 비밀번호가 잘못되었습니다."
        }
    }

    func logout() {
        id = ""
        password = ""
        isLoggedIn = false
        errorMessage = nil
    }
}
