import SwiftUI

struct StoreSheetView: View {
    @State private var stores: [StoreModel] = []

    var body: some View {
        VStack {
            HStack {
                Text("매장 설정")
                    .font(.title3.bold())
                Spacer()
                Button(action: {
                    print("지도 버튼 클릭됨")
                }) {
                    Image(systemName: "map")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.green)
                }
            }
            .padding()

            TextField("검색", text: .constant(""))
                .padding(10)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .padding(.horizontal)

            HStack {
                Text("가까운 매장")
                    .font(.subheadline)
                    .foregroundColor(.green)
                    .bold()
                Text("|")
                    .foregroundColor(.gray)
                Text("자주 가는 매장")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            .padding(.vertical, 4)
            .frame(maxWidth: .infinity, alignment: .leading)

            Divider()

            if stores.isEmpty {
                Spacer()
                Text("매장 데이터를 불러오는 중...")
                    .foregroundColor(.gray)
                Spacer()
            } else {
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 12) {
                        ForEach(stores) { store in
                            HStack(alignment: .top, spacing: 12) {
                                Rectangle()
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(8)

                                VStack(alignment: .leading, spacing: 6) {
                                    HStack {
                                        Text(store.name)
                                            .font(.headline)
                                        if store.category == .reserve {
                                            Text("R")
                                                .font(.caption2)
                                                .padding(4)
                                                .background(Color.yellow.opacity(0.8))
                                                .cornerRadius(4)
                                        }
                                        if store.category == .dt {
                                            Text("D")
                                                .font(.caption2)
                                                .padding(4)
                                                .background(Color.green.opacity(0.8))
                                                .cornerRadius(4)
                                        }
                                    }

                                    Text(store.address)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)

                                    if let distance = store.distance {
                                        Text(String(format: "%.1fkm", distance))
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                }
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
        }
        .onAppear {
            stores = StoreParser.loadStores()
        }
    }
}
