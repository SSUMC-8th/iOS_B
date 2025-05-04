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
    
    // @AppStorage로 저장 (UserDefaults에 저장)
        @AppStorage("user_nickname") var userStorageNickname: String = ""
        @AppStorage("user_email") var userStorageid: String = ""
        @AppStorage("user_password") var userStoragepassword: String = ""
    
    func signup() {
        if signupModel.id.isEmpty || signupModel.password.isEmpty || signupModel.nickname.isEmpty { // 값이 다 1자 이상인지 확인
            showAlert = true
        }else{
            userStorageid = signupModel.id
            userStoragepassword = signupModel.password
            userStorageNickname = signupModel.nickname
        }
    }
    
}
