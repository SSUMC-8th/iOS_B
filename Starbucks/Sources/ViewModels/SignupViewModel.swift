//
//  SignupViewModel.swift
//  Starbucks
//
//  Created by 바견규 on 3/25/25.
//

import Foundation
import SwiftUI

class SignupViewModel: ObservableObject {
    @Published var signupModel = SignupModel(nickname: "", id: "", password: "")
    
    // @AppStorage로 저장 (UserDefaults에 저장)
        @AppStorage("user_nickname") var userStorageNickname: String = ""
        @AppStorage("user_email") var userStorageid: String = ""
        @AppStorage("user_password") var userStoragepassword: String = ""
    
    func signup() {
        userStorageid = signupModel.id
        userStoragepassword = signupModel.password
        userStorageNickname = signupModel.nickname
    }
    
}
