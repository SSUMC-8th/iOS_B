//
//  LoginViewModel.swift
//  Starbucks
//
//  Created by 박현규 on 3/18/25.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var id: String = ""
    @Published var password: String = ""

    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String?

    var isValid: Bool {
        !id.isEmpty && !password.isEmpty
    }

    func login() {
        let dummyUser = User(id: "test", password: "1234")

        if id == dummyUser.id && password == dummyUser.password {
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
