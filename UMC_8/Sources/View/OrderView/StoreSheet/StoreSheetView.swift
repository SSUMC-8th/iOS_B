//
//  StoreSheetView.swift
//  Starbucks
//
//  Created by 바견규 on 4/30/25.
//

import SwiftUI
struct StoreSheetView: View {
    @ObservedObject var viewModel: OrderViewModel

    var body: some View {
        VStack(spacing: 16) {
            // 1. 네비게이션
            HStack {
                Spacer()
                Text("매장 설정")
                    .font(Font.Pretend.pretendardMedium(size: 16))
                    .foregroundColor(Color("black03"))
                Spacer()
                Button(action: {
                    viewModel.isMapMode.toggle()
                }) {
                    Image(systemName: viewModel.isMapMode ? "list.bullet" : "map")
                        .resizable()
                        .frame(width: 18, height: 17)
                        .foregroundColor(Color("gray04"))
                }
            }
            .padding()

            // 2. 검색바
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.1))
                .frame(height: 36)
                .overlay(
                    HStack {
                        Text("검색")
                            .foregroundColor(.gray)
                            .padding(.leading, 10)
                        Spacer()
                    }
                )
                .padding(.horizontal)

            // 3. 세그먼트 버튼
            HStack(spacing: 16) {
                Button(action: {
                    viewModel.StoreTab = .nearby
                }) {
                    Text("가까운 매장")
                        .font(viewModel.StoreTab == .nearby ? Font.Pretend.pretendardSemiBold(size: 13): Font.Pretend.pretendardRegular(size: 13))
                        .foregroundColor(viewModel.StoreTab == .nearby ? Color("black03") : Color("gray03"))
                }

                Divider()
                    .frame(height: 16)

                Button(action: {
                    viewModel.StoreTab = .frequent
                }) {
                    Text("자주 가는 매장")
                        .font(viewModel.StoreTab == .frequent ? Font.Pretend.pretendardSemiBold(size: 13): Font.Pretend.pretendardRegular(size: 13))
                        .foregroundColor(viewModel.StoreTab == .frequent ? Color("black03") : Color("gray03"))
                }
                
                Spacer()
            }
            .padding(.horizontal)
            
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(height: 1)
            
            // 4. 매장 리스트
            if viewModel.isMapMode {
                MapView(viewModel: viewModel)
            }else{
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(viewModel.nearbyStores) { store in
                            StoreRowView(store: store, distance: store.distance(from: LocationManager.shared.currentLocation), viewModel: viewModel)
                            Divider().padding(.leading, 92)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
            
    }
}
#Preview {
    let vm = OrderViewModel()
    StoreSheetView(viewModel: vm)
}
