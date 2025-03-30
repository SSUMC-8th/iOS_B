//
//  SignupViewModel.swift
//  UMC_8
//
//  Created by 소민준 on 3/27/25.
//


//
//  SignupViewModel.swift
//  UMCStarBucks
//
//  Created by 소민준 on 3/27/25.
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
