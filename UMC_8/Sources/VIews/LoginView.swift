//
//  LoginView.swift
//  UMC_8
//
//  Created by 소민준 on 3/20/25.
//





import Foundation
import SwiftUI

struct LoginView: View {
    @State private var id: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Spacer().frame(height: 104) // 상단 여백
            loginLogo
            loginTextField
            snsLogin
            Spacer().frame(height: 90.95) // 하단 여백
                
        }
    }
    // 로그인 상단뷰
    private var loginLogo: some View {
        Group {
            VStack(alignment: .leading) {
                Image("Starbuckslogo")
                    .resizable()
                    .frame(width: 97, height: 95)
                Spacer().frame(height: 29)
                Text("안녕하세요.\n스타벅스입니다!")
                    .font(.PretendardExtraBold24)
                    .padding(.bottom, 15)
                Text("회원 서비스 이용을 위해 로그인 해주세요")
                    .font(.PretendardMedium16)
                    .foregroundStyle(Color(.gray))
            }
            .frame(maxWidth: 402, minHeight: 270, alignment: .leading)
            .padding(19)
        }
    }
    // 로그인 텍스트필드
    private var loginTextField: some View {
        Group {
            VStack {
                TextField("아이디", text: $id)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(.PretendardRegular13)
                Divider()
                Spacer().frame(height: 20)
                SecureField("비밀번호", text: $password)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(.PretendardRegular13)
                Divider()
                Spacer().frame(height: 47)
                Button(action: {
                    print("로그인 버튼")
                }) {
                    Text("로그인하기")
                        .font(.PretendardMedium16)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 46)
                        .background(Color("green01"))
                        .cornerRadius(20)
                }            }
        }
        .frame(maxWidth: 402, minHeight: 180)
        .padding(19)
    }
    // 하단 sns 로그인
    private var snsLogin: some View {
        VStack(alignment: .center) {
            Text("이메일로 회원가입하기")
                .font(.PretendardRegular12)
                .foregroundStyle(Color(.gray))
                .underline()
                .padding(.bottom, 10)
            Image("kakaologinbutton")
                .resizable()
                .frame(width: 305, height: 45)
                .padding(.bottom, 10)
            Image("appleloginbutton")
                .resizable()
                .frame(width: 305, height: 45)
        }
        .frame(maxWidth: 306, minHeight: 104)
        .padding(.top, 30)
    }
    
}

#Preview {
    LoginView()
}
