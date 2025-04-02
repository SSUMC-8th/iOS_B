import SwiftUI

enum Tab {
    case home, pay, order, shop, other
}

struct StarbucksTabView: View {
    @State private var selectedTab: Tab = .home

    var body: some View {
        TabView(selection: $selectedTab) {

            Color.white
                .ignoresSafeArea()
                .tabItem {
                    VStack {
                        Image(selectedTab == .home ? "icon1_1" : "icon1")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                }
                .tag(Tab.home)

            Color.white
                .ignoresSafeArea()
                .tabItem {
                    VStack {
                        Image(selectedTab == .pay ? "icon2_1" : "icon2")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 30, height: 30)

                    }
                }
                .tag(Tab.pay)

            Color.white
                .ignoresSafeArea()
                .tabItem {
                    VStack {
                        Image(selectedTab == .order ? "icon3_1" : "icon3")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                }
                .tag(Tab.order)

            Color.white
                .ignoresSafeArea()
                .tabItem {
                    VStack {
                        Image(selectedTab == .shop ? "icon4_1" : "icon4")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                }
                .tag(Tab.shop)

            OtherView()
                .ignoresSafeArea()
                .tabItem {
                    VStack {
                        Image(selectedTab == .other ? "icon5_1" : "icon5")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                }
                .tag(Tab.other)
        }
        .tint(.green)
    }
}

#Preview {
    StarbucksTabView()
}
