import SwiftUI
import Observation

@Observable
class HomeViewModel {
    @AppStorage("savedNickname") var savedNickname: String = ""

    var nicknameText: String {
        savedNickname.isEmpty ? "(설정 닉네임)" : savedNickname
    }

    let coffeeList: [ItemModel] = [
        .init(name: "디카페인 콜드브루", imageName: "coffee1"),
        .init(name: "콜드브루 플로트", imageName: "coffee2"),
        .init(name: "바닐라 크림 콜드브루", imageName: "coffee3"),
        .init(name: "헤이즐넛 콜드브루", imageName: "coffee4"),
        .init(name: "리저브 콜드브루", imageName: "coffee5"),
        .init(name: "커피 엣셋", imageName: "coffee6")
    ]

    let whatsNewList: [ItemModel] = [
        .init(name: "광고1", imageName: "ad1"),
        .init(name: "광고2", imageName: "ad2"),
        .init(name: "광고3", imageName: "ad3")
    ]

    let breadList: [ItemModel] = [
        .init(name: "너츠 앤 프레첼", imageName: "bread1"),
        .init(name: "베이컨 포카치아", imageName: "bread2"),
        .init(name: "치즈 롤", imageName: "bread3"),
        .init(name: "통밀식빵", imageName: "bread4"),
        .init(name: "스콘&크로와상", imageName: "bread5")
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

struct HomeView: View {
    @State private var viewModel = HomeViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // 상단 배너
                ZStack(alignment: .bottomLeading) {
                    Image("banner_background") // 노란색 배경 이미지
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

                // 이미지 배너
                Image("ice_americano")
                    .resizable()
                    .scaledToFit()

                // 추천 메뉴
                VStack(alignment: .leading) {
                    Text("\(viewModel.nicknameText)님을 위한 추천 메뉴")
                        .font(.headline)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.coffeeList) { coffee in
                                CircleImageCard(item: coffee)
                            }
                        }
                    }
                }

                // 배너 이미지들
                VStack(spacing: 16) {
                    Image("blooming_banner")
                        .resizable()
                        .scaledToFit()
                    Image("launch_banner")
                        .resizable()
                        .scaledToFit()
                }

                // What's New
                VStack(alignment: .leading) {
                    Text("What's New")
                        .font(.headline)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.whatsNewList) { ad in
                                CircleImageCard(item: ad)
                            }
                        }
                    }
                }

                // 하단 3개 배너
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

                // 디저트
                VStack(alignment: .leading) {
                    Text("하루가 달콤해지는 디저트")
                        .font(.headline)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.breadList) { bread in
                                CircleImageCard(item: bread)
                            }
                        }
                    }
                }

                // 하단 이미지들
                VStack(spacing: 16) {
                    Image("bottom1")
                        .resizable()
                        .scaledToFit()
                    Image("bottom2")
                        .resizable()
                        .scaledToFit()
                }
            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
}
