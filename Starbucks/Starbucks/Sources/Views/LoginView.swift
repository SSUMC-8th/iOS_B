//
//  LoginView.swift
//  Starbucks
//
//  Created by 박현규 on 3/18/25.
//

import SwiftUI

struct InputLoginView: View {
    var body: some View {
        VStack{
            Text("아이디")
                .frame(width: 401, height: 20, alignment: .leading)
                .font(Font.Pretend.pretendardRegular(size: 13))
                .shadow(color: .gray, radius: 10)
            Divider()
            
            Spacer().frame(height: 47)
            
            Text("비밀번호")
                .frame(width: 401, height: 20, alignment: .leading)
                .font(Font.Pretend.pretendardRegular(size: 13))
                .shadow(color: .gray, radius: 10)
            Divider()
            
            Spacer().frame(height: 47)
            
            Button(action: {
                        print("Hello")
            }, label: {
                Text("로그인하기")
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: 402, maxHeight: 46)
            })
            .frame(width: 402, height: 46)
            .buttonStyle(.borderedProminent) // 버튼 스타일 적용
            .tint(Color(hex: "#01A862")) // 버튼 색상 적용
            .font(Font.Pretend.pretendardMedium(size: 16))
            .cornerRadius(20)
        }
    }
}

struct TitleView: View {
    var body: some View {
        VStack(alignment: .leading){
            Image("starbucks_Logo")
                .resizable()
                .frame(width: 97, height: 95)
                .shadow(color: .gray, radius: 10,x:5, y: 5)
            
            Spacer().frame(height: 28)
            
            Text("안녕하세요.\n스타벅스입니다.")
                .font(Font.Pretend.pretendardExtraBold(size: 24))
    
            Spacer().frame(height: 19)
            
            Text("회원 서비스 이용을 위해 로그인 해주세요")
                .frame(width: 402, height: 19,alignment: .leading)
                .font(Font.Pretend.pretendardMedium(size: 16))
                .foregroundStyle(Color(hex: "#BFBDBD"))
                .shadow(color: .gray, radius: 10,x:5, y: 5)
            
            
        }
    }
}

struct SignUpView: View {
    var body: some View {
        
        Text("이메일로 회원가입하기")
            .underline()
            .font(Font.Pretend.pretendardRegular(size: 12))
            .foregroundStyle(Color(hex: "#787878"))
            .shadow(color: .gray, radius: 10,x:5, y: 5)
            
        Spacer().frame(height: 21)
        
        Button(action: {
                    print("Hello")
        }, label: {
            Image("kakao_Logo")
            Text("카카오 로그인")
                .frame(width: 301, height: 45)
                .foregroundStyle(Color.black)
                .frame(maxWidth: .infinity)
                .font(Font.Pretend.pretendardMedium(size: 16))
        })
        .frame(width: 306, height: 45)
        .buttonStyle(.borderedProminent) // 버튼 스타일 적용
        .tint(Color(hex: "#FEE500")) // 버튼 색상 적용
        .fixedSize(horizontal: false, vertical: true)
        
        Spacer().frame(height: 21)
        
        Button(action: {
                    print("Hello")
        }, label: {
            Image("apple_Logo")
            Text("Apple로 로그인")
                .frame(width: 306, height: 45)
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity)
                .font(Font.Pretend.pretendardMedium(size: 16))
        })
        .frame(width: 306, height: 45)
        .buttonStyle(.borderedProminent) // 버튼 스타일 적용
        .tint(Color(hex: "#000000"))
        .fixedSize(horizontal: false, vertical: true)
        
        
    }
    
    
}

#Preview {
    Group{
        Spacer().frame(height: 104)
        VStack(){
            TitleView()
                .fixedSize()
            Spacer()
            InputLoginView()
                .fixedSize()
            Spacer()
            SignUpView()
                .fixedSize(horizontal: true, vertical: false)
        }
        .frame(width: 401,height:751, alignment: .top)
        .fixedSize(horizontal: true, vertical: false)
    }
        
}
