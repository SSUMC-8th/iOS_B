//
//  OtherView.swift
//  UMC_8
//
//  Created by 소민준 on 3/30/25.
//

import SwiftUI
//상단바 뷰
struct UpperView: View {
    @AppStorage("nickname") var nickname: String = ""
    
    var body: some View {
        HStack{
            Text("Other")
                .font(Font.PretendardBold24)
            Spacer()
            Button(action:{print("로그아웃")}){Image("logout")}
                .frame(width: 35,height: 35)
        }
        .padding(.horizontal)
    }
}
//환영합니다view
struct WelcomeNameView: View {
    @AppStorage("nickname") var nickname: String = ""
    
    var body: some View {
        HStack {
            (
                Text(nickname.isEmpty ? "(작성한 닉네임)" : nickname)
                    .foregroundStyle(Color(hex: "#00B375"))
                +
                Text(" 님\n 환영합니다. 🙌🏻")
                    .foregroundStyle(.primary)
            )
            .font(Font.PretendardSemiBold24)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding()

    }
}

//상단 버튼 뷰
struct UpperButtonView: View {
    
    var body: some View {
        HStack {
            ForEach(buttonData, id: \.title) { data in
                OtherActionButton(title: data.title, imageName: data.imageName, width: data.width, height: data.height)
                    .frame(width: 102, height: 108)
                    .background(Color(hex: "#FFFFFF"))
                    .cornerRadius(15)
                    
            }
        }
        .frame(width: 327, height: 108)
        .padding(.horizontal, 24)

    }
}

struct OtherActionButton: View{
    let title: String
    let imageName: String
    let width: CGFloat?
    let height: CGFloat?

    var body: some View {
        ZStack{
            
            Button(action: {
                print(title)
            }) {
                VStack {
                    Image(imageName)
                        .resizable()
                        .frame(width: width, height: height) // 이미지 실제 사이즈
                        .frame(height: 48) // 이미지 영역 높이 고정
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    
                    
                    Text(title)
                        .font(Font.PretendardSemiBold16)
                        .foregroundStyle(Color(hex: "#111111"))
                }.padding(.vertical)
                
            }
        }
    }
}

struct PayAndCSButton: View{
    let title: String
    let imageName: String
    let width: CGFloat?
    let height: CGFloat?

    var body: some View {
            
        
        Button(action: {
            print(title)
        }) {
            HStack {
                Image(imageName)
                    .resizable()
                    .frame(width: width, height: height) // 
                    .frame(maxWidth: 32, minHeight: 32)
                
                
                
                Text(title)
                    .font(Font.PretendardSemiBold16)
                    .foregroundStyle(Color(hex: "#111111"))

                
                Spacer()
            }
            .padding(.horizontal,12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 32)
            
        }
    }
}

let buttonData: [(title: String, imageName: String, width: CGFloat?, height: CGFloat?)] = [
    ("별 히스토리", "myStar", width: 30, height: 30),
    ("전자영수증", "myReceipt", width: 30, height: 30),
    ("나만의 메뉴", "mymenu", width: 48, height: 48)
]

let payButtonData: [[(title: String, imageName: String, width: CGFloat?, height: CGFloat?)]] = [
    [("스타벅스 카드 등록", "Payicon1", width: 24, height: 16),
     ("카드 교환권 등록", "Payicon2", width: 26, height: 23)],
    [("쿠폰 등록", "Payicon3", width: 24, height: 18),
     ("쿠폰 히스토리", "Payicon4", width: 26, height: 23)]
]

let CSButtonData: [[(title: String, imageName: String, width: CGFloat?, height: CGFloat?)]] = [
    [("스토어 케어", "CSicon1", width: 20, height: 24),
     ("고객의 소리", "CSicon2", width: 24, height: 24)],
    [("매장 정보", "CSicon3", width: 32, height: 24),
     ("반납기 정보", "CSicon4", width: 22, height: 21)]
]


struct PayView: View {
    var body: some View {
        Text("Pay")
            .font(Font.PretendardSemiBold18)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
        VStack(alignment: .leading, spacing: 0) {
            ForEach(0..<payButtonData.count, id: \.self) { rowIndex in
                HStack {
                    PayAndCSButton(
                        title: payButtonData[rowIndex][0].title,
                        imageName: payButtonData[rowIndex][0].imageName,
                        width: payButtonData[rowIndex][0].width,
                        height: payButtonData[rowIndex][0].height
                    )
                    .padding(.vertical, 16)
                    
                    Spacer()
                    
                    PayAndCSButton(
                        title: payButtonData[rowIndex][1].title,
                        imageName: payButtonData[rowIndex][1].imageName,
                        width: payButtonData[rowIndex][1].width,
                        height: payButtonData[rowIndex][1].height
                    )
  //                  .padding(.vertical, 16)
                    
                }.frame(maxWidth: 418)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        Divider()
        
    }
}

struct CSView: View {
    var body: some View {
        // CS 부분
        Text("고객지원")
            .font(Font.PretendardSemiBold18)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
        
        VStack(alignment: .leading, spacing: 0) {
            ForEach(0..<CSButtonData.count, id: \.self) { rowIndex in
                HStack {
                    PayAndCSButton(
                        title: CSButtonData[rowIndex][0].title,
                        imageName: CSButtonData[rowIndex][0].imageName,
                        width: CSButtonData[rowIndex][0].width,
                        height: CSButtonData[rowIndex][0].height
                    )
                    .padding(.vertical  , 16)
                    
                    Spacer()
                    
                    PayAndCSButton(
                        title: CSButtonData[rowIndex][1].title,
                        imageName: CSButtonData[rowIndex][1].imageName,
                        width: CSButtonData[rowIndex][1].width,
                        height: CSButtonData[rowIndex][1].height
                    )
                    .padding(.vertical, 16)
                    
                }.frame(maxWidth: 418)
            }
            
            PayAndCSButton(title: "마이 스타벅스 리뷰", imageName: "CSicon5", width:24, height: 24)
                .frame(height: 32)
                .padding(.vertical, 16)
        }
    }
}

//총합 view
struct OtherView:View {
    @AppStorage("nickname") var nickname: String = ""
    
    var body: some View {
        VStack{
            UpperView()
            ZStack{
                Color(hex: "#F8F8F8")
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    WelcomeNameView()
                    UpperButtonView()
                    Spacer()
                    PayView()
                    Spacer()
                    CSView()
                    Spacer()
                }
            }
        }

    }
}

#Preview {
    OtherView()

}

