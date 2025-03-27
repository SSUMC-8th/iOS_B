//
//  StarbucksTabView.swift
//  Starbucks
//
//  Created by 바견규 on 3/26/25.
//

import SwiftUI

struct StarbucksTabView: View {
    @State private var selectedTab: String = "Home"

    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selectedTab) {
                Text("홈 화면")
                    .tag("Home")

                Text("결제 화면")
                    .tag("Pay")

                Text("주문 화면")
                    .tag("Order")

                Text("매장 화면")
                    .tag("Shop")

                OtherView()
                    .tag("Other")
            }
            .tabViewStyle(.page(indexDisplayMode: .never))

            HStack {
                tabButton(title: "Home", defaultImage: "icon1", selectedImage: "icon1selected")
                tabButton(title: "Pay", defaultImage: "icon02", selectedImage: "icon02selected")
                tabButton(title: "Order", defaultImage: "icon3", selectedImage: "icon3selected")
                tabButton(title: "Shop", defaultImage: "icon4", selectedImage: "icon4selected")
                tabButton(title: "Other", defaultImage: "icon5", selectedImage: "icon5selected")
            }
            .padding()
            .background(Color.white)
        }
    }

    @ViewBuilder
    private func tabButton(title: String, defaultImage: String, selectedImage: String) -> some View {
        Button {
            selectedTab = title
        } label: {
            VStack(spacing: 4) {
                Image(selectedTab == title ? selectedImage : defaultImage)
                    .frame(width: 24, height: 24)
                
                Text(title)
                    .font(.caption)
                    .foregroundColor(selectedTab == title ? Color.green : .gray)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    StarbucksTabView()
}
