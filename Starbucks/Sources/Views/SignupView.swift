//
//  SignupView.swift
//  Starbucks
//
//  Created by 바견규 on 3/25/25.
//

import SwiftUI

struct UserInfoView: View {
    @ObservedObject var signUpViewModel: SignupViewModel // 전달 받기
    
    var body: some View {
        TextField("닉네임", text: $signUpViewModel.signupModel.nickname
        )
            .frame(width: 402, height: 30, alignment: .leading)
            .font(Font.Pretend.pretendardRegular(size: 18))
            .shadow(color: .gray, radius: 10)
        Divider()
            
        Spacer().frame(height: 49)
        
        TextField("이메일", text: $signUpViewModel.signupModel.id
        )
        .frame(width: 402, height: 30, alignment: .leading)
        .font(Font.Pretend.pretendardRegular(size: 18))
        .shadow(color: .gray, radius: 10)
    Divider()
        
            Spacer().frame(height: 49)
        
        TextField("비밀번호", text: $signUpViewModel.signupModel.password
        )
        .frame(width: 402, height: 30, alignment: .leading)
        .font(Font.Pretend.pretendardRegular(size: 18))
        .shadow(color: .gray, radius: 10)
    Divider()
        
    }
}

struct SubmitBtnView: View {
    @ObservedObject var signUpViewModel: SignupViewModel // 전달 받기
    @Binding var isSignedUp: Bool
    @AppStorage("nickname") var nickname: String = ""
    
    var body: some View {
        Button(action: {
            signUpViewModel.signup()
            nickname = signUpViewModel.signupModel.nickname
            isSignedUp = true
        }, label: {
            Text("생성하기")
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity)
                .font(Font.Pretend.pretendardMedium(size: 18))
                .padding(.vertical, 19)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                    .fill(Color(hex: "#01A862"))
                )
        })

    }
}

struct EmailSignupView: View {
    @State private var isSignedUp = false
    @StateObject private var signUpViewModel = SignupViewModel()
    var body: some View {
        NavigationStack{
            VStack(){
                Spacer().frame(height: 210)
                UserInfoView(signUpViewModel: signUpViewModel)
                Spacer()
                SubmitBtnView(signUpViewModel: signUpViewModel, isSignedUp: $isSignedUp)
            }
            .padding()
            .navigationDestination(isPresented: $isSignedUp) {
                StarbucksTabView() // 회원가입 후 보여줄 TabView
            }
        }

    }
}

#Preview {
    EmailSignupView()
}
