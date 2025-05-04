//
//  OtherFindStoreView.swift
//  Starbucks
//
//  Created by 소민준 on 4/30/25.
//

import SwiftUI

struct StoreFinderView: View {
    @StateObject var viewModel = OrderViewModel()
    @Environment(\.presentationMode) var presentationMode
    @Namespace private var animation
    @State private var selectedTab: StoreFindTab = .findStore

    var body: some View {
        VStack(spacing: 0) {
            // 1. 상단 네비게이션
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .foregroundColor(.black)
                }

                Spacer()

                Text("매장 찾기")
                    .font(.headline)
                    .foregroundColor(.black)

                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 10)

            // 2. 상단 세그먼트
            HStack {
                ForEach(StoreFindTab.allCases, id: \.self) { tab in
                    VStack(spacing: 4) {
                        Button(action: {
                            withAnimation(.easeInOut) {
                                selectedTab = tab
                            }
                        }) {
                            Text(tab.rawValue)
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(selectedTab == tab ? .black : .gray)
                        }

                        if selectedTab == tab {
                            Capsule()
                                .fill(Color.brown)
                                .frame(height: 3)
                                .matchedGeometryEffect(id: "underline", in: animation)
                        } else {
                            Color.clear.frame(height: 3)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.top, 12)
            .padding(.horizontal)
            .background(Color.white)

            // 3. 하단 뷰
            ZStack {
                switch selectedTab {
                case .findStore:
                    MapView(viewModel: viewModel)
                        .transition(.opacity)
                case .findRoute:
                    Text("길찾기 기능은 나중에 구현합니다.")
                        .foregroundColor(.gray)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .ignoresSafeArea(edges: .bottom)
        .background(Color.white)
        .navigationBarHidden(true)
    }
}



#Preview {
    StoreFinderView()
}
