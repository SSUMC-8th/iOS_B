//
//  SignupView.swift
//  Starbucks
//
//  Created by 소민준 on 3/25/25.
//

import SwiftUI

struct signupNavigationView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            HStack{
                Button(action: {
                    dismiss()
                }, label: {
                    Image("chevron-left")
                        .resizable()
                        .frame(width: 24, height: 24)
                        
                })
                Spacer()
                Text("가입하기")
                    .font(Font.Pretend.pretendardMedium(size: 16))
                Spacer()
                
                // 👉 오른쪽에 같은 크기의 빈 공간으로 균형 맞추기
                // (투명 뷰로, 왼쪽 버튼과 같은 너비를 차지)
                Color.clear
                    .frame(width: 24, height: 24)
            }
        }
        .navigationBarBackButtonHidden(true) // 자동으로 생기는 Back 버튼 비활성화

    }
}

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
            if !signUpViewModel.showAlert{ // 모든 값이 1자 이상인 경우
                isSignedUp = true
            }
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
        .alert(isPresented: $signUpViewModel.showAlert) {
            Alert(title: Text("입력 오류"), message: Text("모든 항목을 입력해주세요."), dismissButton: .default(Text("확인")))
        }

    }
}

struct EmailSignupView: View {
    @State private var isSignedUp = false
    @StateObject private var signUpViewModel = SignupViewModel()
    var body: some View {
        NavigationStack{
            VStack(){
                signupNavigationView()
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
