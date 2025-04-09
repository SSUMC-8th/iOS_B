import SwiftUI
import Observation

@Observable
class HomeViewModel {
    let coffeeList: [ItemModel] = [
        .init(name: "에스프레소 콘파나", imageName: "coffee1"),
        .init(name: "에스프레소 마키아또", imageName: "coffee2"),
        .init(name: "아이스 카페 아메리카노", imageName: "coffee3"),
        .init(name: "카페 아메리카노", imageName: "coffee4"),
        .init(name: "아이스 카라멜 마키아또", imageName: "coffee5"),
        .init(name: "카라멜 마키아또", imageName: "coffee6")
    ]

    let whatsNewList: [ItemModel] = [
        .init(name: "", imageName: "ad1"),
        .init(name: "", imageName: "ad2"),
        .init(name: "", imageName: "ad3")
    ]

    let breadList: [ItemModel] = [
        .init(name: "", imageName: "bread1"),
        .init(name: "", imageName: "bread2"),
        .init(name: "", imageName: "bread3"),
        .init(name: "", imageName: "bread4"),
        .init(name: "", imageName: "bread5")
    ]
}

struct ItemModel: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
}

struct CircleImageCard: View {
    let item: ItemModel

    var body: some View {
        VStack {
            Image(item.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
            Text(item.name)
                .font(.caption)
        }
        .frame(width: 100)
    }
}

struct RectangleImageCard: View {
    let item: ItemModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(item.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .cornerRadius(8)
            Text(item.name)
                .font(.caption)
                .foregroundColor(.black)
        }
        .frame(width: 120)
    }
}

struct HomeView: View {
    @State private var viewModel = HomeViewModel()
    @AppStorage("savedNickname") private var savedNickname: String = ""
    @State private var isPopupPresented = true

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ZStack(alignment: .bottomLeading) {
                    Image("top_banner")
                        .resizable()
                        .scaledToFit()
                    VStack(alignment: .leading, spacing: 10) {
                        Text("골든 미모사 그린 티")
                            .font(.title2.bold())
                        Text("11★ until next Reward")
                        Text("1/12★")
                    }
                    .padding()
                }

                Image("ice_banner")
                    .resizable()
                    .scaledToFit()

                VStack(alignment: .leading) {
                    Text("\(savedNickname.isEmpty ? "(설정 닉네임)" : savedNickname)님을 위한 추천 메뉴")
                        .font(.headline)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.coffeeList) { coffee in
                                CircleImageCard(item: coffee)
                            }
                        }
                    }
                }

                VStack(spacing: 16) {
                    Image("blooming_banner")
                        .resizable()
                        .scaledToFit()
                    Image("launch_banner")
                        .resizable()
                        .scaledToFit()
                }

                VStack(alignment: .leading) {
                    Text("What's New")
                        .font(.headline)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.whatsNewList) { ad in
                                RectangleImageCard(item: ad)
                            }
                        }
                    }
                }

                VStack(spacing: 16) {
                    Image("mug_banner")
                        .resizable()
                        .scaledToFit()
                    Image("store_star_banner")
                        .resizable()
                        .scaledToFit()
                    Image("delivery_banner")
                        .resizable()
                        .scaledToFit()
                }

                VStack(alignment: .leading) {
                    Text("하루가 달콤해지는 디저트")
                        .font(.headline)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.breadList) { bread in
                                RectangleImageCard(item: bread)
                            }
                        }
                    }
                }

                VStack(spacing: 16) {
                    Image("bottom1")
                        .resizable()
                        .scaledToFit()
                    Image("bottom2")
                        .resizable()
                        .scaledToFit()
                    Image("bottom3")
                        .resizable()
                        .scaledToFit()
                }
            }
            .padding()
        }
        .sheet(isPresented: $isPopupPresented) {
            AdPopupView()
        }
    }
}
