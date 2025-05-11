//
//  LoginModel.swift
//  Starbucks
//
//  Created by 소민준 on 3/18/25.
//

import Foundation
import SwiftUI

struct User {
    @AppStorage("user_email") static var id: String = ""
    @AppStorage("user_password") static var password: String = ""

    static func current() -> User {
        return User(id: id, password: password)
    }

    let id: String
    let password: String
}
