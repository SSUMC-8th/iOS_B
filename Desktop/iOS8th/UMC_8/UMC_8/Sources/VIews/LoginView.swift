//
//  LoginView.swift
//  UMC_8
//
//  Created by 소민준 on 3/20/25.
//




import SwiftUI

struct InputLoginView: View {
    var body: some View {
        VStack{
            Text("아이디")
                .frame(width: 401, height: 20, alignment: .leading)
                .font(.PretendardRegular13)
                .shadow(color: .gray, radius: 10)
            Divider()
            
            Spacer().frame(height: 47)
            
            Text("비밀번호")
                .frame(width: 401, height: 20, alignment: .leading)
                .font(.PretendardRegular13)
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
            .tint(Color("#01A862")) // 버튼 색상 적용
            .font(.PretendardMedium16)
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
                .font(.PretendardBold24)
    
            
            Text("회원 서비스 이용을 위해 로그인 해주세요")
                .frame(width: 402, height: 19,alignment: .leading)
                .font(.PretendardMedium16)
                .foregroundStyle(Color("#BFBDBD"))
                .shadow(color: .gray, radius: 10,x:5, y: 5)
            
            
        }
    }
}


