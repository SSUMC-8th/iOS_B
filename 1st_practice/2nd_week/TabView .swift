import SwiftUI

enum Tab {
    case home, pay, order, shop, other
}

struct StarbucksTabView: View {
    @State private var selectedTab: Tab = .home

    var body: some View {
        TabView(selection: $selectedTab) {

            HomeView()
                .tabItem {
                    VStack {
                        Image(selectedTab == .home ? "icon1_1" : "icon1")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                }
                .tag(Tab.home)

            Color.white
                .tabItem {
                    VStack {
                        Image(selectedTab == .pay ? "icon2_1" : "icon2")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                }
                .tag(Tab.pay)

            Color.white
                .tabItem {
                    VStack {
                        Image(selectedTab == .order ? "icon3_1" : "icon3")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                }
                .tag(Tab.order)

            ShopView()
                .tabItem {
                    VStack {
                        Image(selectedTab == .shop ? "icon4_1" : "icon4")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                }
                .tag(Tab.shop)

            OtherView()
                .tabItem {
                    VStack {
                        Image(selectedTab == .other ? "icon5_1" : "icon5")
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
