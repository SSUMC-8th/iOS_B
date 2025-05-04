import SwiftUI

struct ShopView: View {
    let allProducts = [
        ("텀블러", "item.1"),
        ("커피 용품", "item.2"),
        ("선물세트", "item.3"),
        ("보온병", "item.4"),
        ("머그잔", "item.5"),
        ("키링", "item.6")
    ]

    let bestItemsPage1 = [
        ("그린 사이렌 슬리브 머그\n355ml", "bestitem1"),
        ("그린 사이렌 클래식 머그\n355ml", "bestitem2")
    ]

    let bestItemsPage2 = [
        ("사이렌 머그 앤 우드 소서", "bestitem3"),
        ("리저브 골드 테일 머그\n355ml", "bestitem4")
    ]

    let newProducts = [
        ("그린 사이렌 도트 머그\n237ml", "new1"),
        ("그린 사이렌 도트 머그\n355ml", "new2"),
        ("홈 카페 미니 머그 세트", "new3"),
        ("홈 카페 글라스 세트", "new4")
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                Text("Starbucks Online Store")
                    .font(.title2.bold())
                    .padding(.horizontal)

                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 12) {
                        Image("shop_banner1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)
                        Image("shop_banner2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)
                        Image("shop_banner3")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)
                    }
                    .padding(.horizontal)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("All Products")
                        .font(.headline)
                        .padding(.horizontal)

                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 20) {
                            ForEach(allProducts, id: \.0) { item in
                                VStack {
                                    Image(item.1)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                    Text(item.0)
                                        .font(.caption)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Best Items")
                        .font(.headline)
                        .padding(.horizontal)

                    TabView {
                        HStack(spacing: 20) {
                            ForEach(bestItemsPage1, id: \.0) { item in
                                VStack {
                                    Image(item.1)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 120)
                                    Text(item.0)
                                        .font(.caption)
                                        .multilineTextAlignment(.center)
                                }
                            }
                        }
                        .padding()

                        HStack(spacing: 20) {
                            ForEach(bestItemsPage2, id: \.0) { item in
                                VStack {
                                    Image(item.1)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 120)
                                    Text(item.0)
                                        .font(.caption)
                                        .multilineTextAlignment(.center)
                                }
                            }
                        }
                        .padding()
                    }
                    .frame(height: 200)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("New Products")
                        .font(.headline)
                        .padding(.horizontal)

                    LazyVGrid(columns: [GridItem(), GridItem()], spacing: 16) {
                        ForEach(newProducts, id: \.0) { item in
                            VStack {
                                Image(item.1)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 100)
                                Text(item.0)
                                    .font(.caption)
                                    .multilineTextAlignment(.center)
                            }
                        }
                    }
                    .padding(.horizontal)
                }

                Spacer()
            }
            .padding(.top)
        }
    }
}

#Preview {
    ShopView()
}
