//
//  OtherView.swift
//  Starbucks
//
//  Created by 바견규 on 3/26/25.
//
//  OtherView.swift
//  Starbucks App UI - Refactored for Scalability
//  OtherView.swift
//  Starbucks App UI - Refactored for Scalability

import SwiftUI

// MARK: - ButtonItem 모델
struct ButtonItem: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let width: CGFloat?
    let height: CGFloat?
    let destination: AnyView?
}

// MARK: - 상단바
struct UpperView: View {
    @AppStorage("nickname") var nickname: String = ""

    var body: some View {
        HStack {
            Text("Other")
                .font(Font.Pretend.pretendardBold(size: 24))
            Spacer()
            Button(action: { print("로그아웃") }) {
                Image("logout")
            }
            .frame(width: 35, height: 35)
        }
        .padding(.horizontal)
    }
}

// MARK: - 환영 메시지
struct WelcomeNameView: View {
    @AppStorage("nickname") var nickname: String = ""

    var body: some View {
        HStack {
            (
                Text(nickname.isEmpty ? "(작성한 닉네임)" : nickname)
                    .foregroundStyle(Color(hex: "#00B375")) +
                Text(" 님\n 환영합니다. 🙌🏻")
                    .foregroundStyle(.primary)
            )
            .font(Font.Pretend.pretendardSemiBold(size: 24))
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding()
    }
}

// MARK: - 재사용 가능한 버튼 뷰
struct ReusableButton: View {
    let item: ButtonItem

    var body: some View {
        Group {
            if let destination = item.destination {
                NavigationLink(destination: destination) {
                    buttonContent
                }
            } else {
                Button(action: { print(item.title) }) {
                    buttonContent
                }
            }
        }
    }

    private var buttonContent: some View {
        HStack {
            Image(item.imageName)
                .resizable()
                .frame(width: item.width, height: item.height)
                .frame(maxWidth: 32, minHeight: 32)

            Text(item.title)
                .font(Font.Pretend.pretendardSemiBold(size: 16))
                .foregroundStyle(Color(hex: "#111111"))

            Spacer()
        }
        .padding(.horizontal, 12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 32)
    }
}

// MARK: - 버튼 그룹 뷰
struct ButtonGroupView: View {
    let title: String
    let items: [[ButtonItem]]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(Font.Pretend.pretendardSemiBold(size: 18))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)

            ForEach(items, id: \.[0].id) { row in
                HStack {
                    ReusableButton(item: row[0])
                        .padding(.vertical, 16)
                    Spacer()
                    ReusableButton(item: row[1])
                        .padding(.vertical, 16)
                }
            }
        }
    }
}

// MARK: - 상단 액션 버튼 뷰
struct TopActionButtons: View {
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        
        let topButtons: [ButtonItem] = [
                    ButtonItem(title: "별 히스토리", imageName: "myStar", width: 30, height: 30, destination: nil),
                    ButtonItem(
                        title: "전자영수증",
                        imageName: "myReceipt",
                        width: 30,
                        height: 30,
                        destination: AnyView(OtherReceiptView(modelContext: modelContext))
                    ),
                    ButtonItem(title: "나만의 메뉴", imageName: "mymenu", width: 48, height: 48, destination: nil)
                ]
        HStack {
            ForEach(topButtons) { item in
                ReusableTopButton(item: item)
            }
        }
        .frame(width: 327, height: 108)
        .padding(.horizontal, 24)
    }
}

struct ReusableTopButton: View {
    let item: ButtonItem

    var body: some View {
        Group {
            if let destination = item.destination {
                NavigationLink(destination: destination) {
                    topButtonContent
                }
            } else {
                topButtonContent
            }
        }
        .frame(width: 102, height: 108)
        .background(Color.white)
        .cornerRadius(15)
    }

    private var topButtonContent: some View {
        VStack {
            Image(item.imageName)
                .resizable()
                .frame(width: item.width, height: item.height)
                .frame(height: 48)
                .frame(maxWidth: .infinity, alignment: .center)

            Text(item.title)
                .font(Font.Pretend.pretendardSemiBold(size: 16))
                .foregroundStyle(Color(hex: "#111111"))
        }
        .padding(.vertical)
    }
}

// MARK: - 메인 OtherView
struct OtherView: View {
    var body: some View {
        NavigationStack {
            VStack {
                UpperView()
                ZStack {
                    Color(hex: "#F8F8F8").ignoresSafeArea()
                    VStack {
                        Spacer()
                        WelcomeNameView()
                        TopActionButtons()
                        Spacer()
                        ButtonGroupView(title: "Pay", items: payButtonData)
                        Spacer()
                        ButtonGroupView(title: "고객지원", items: csButtonData)
                        Spacer()
                    }
                }
            }
        }
    }
}

// MARK: - 예시 버튼 데이터


let payButtonData: [[ButtonItem]] = [
    [
        ButtonItem(title: "스타벅스 카드 등록", imageName: "Payicon1", width: 24, height: 16, destination: nil),
        ButtonItem(title: "카드 교환권 등록", imageName: "Payicon2", width: 26, height: 23, destination: nil)
    ],
    [
        ButtonItem(title: "쿠폰 등록", imageName: "Payicon3", width: 24, height: 18, destination: nil),
        ButtonItem(title: "쿠폰 히스토리", imageName: "Payicon4", width: 26, height: 23, destination: nil)
    ]
]

let csButtonData: [[ButtonItem]] = [
    [
        ButtonItem(title: "스토어 케어", imageName: "CSicon1", width: 20, height: 24, destination: nil),
        ButtonItem(title: "고객의 소리", imageName: "CSicon2", width: 24, height: 24, destination: nil)
    ],
    [
        ButtonItem(title: "매장 정보", imageName: "CSicon3", width: 32, height: 24, destination: AnyView(StoreFinderView())),
        ButtonItem(title: "반납기 정보", imageName: "CSicon4", width: 22, height: 21, destination: nil)
    ]
]

#Preview{
    OtherView()
}
