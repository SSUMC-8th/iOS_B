//
//  OrderTopTabView.swift
//  Starbucks
//
//  Created by 소민준 on 4/30/25.
//

import SwiftUI

struct OrderTopTabView: View {
    @ObservedObject var viewModel: OrderViewModel
    @Namespace private var animation

    var body: some View {
        VStack{
            HStack(spacing: 20) {
                ForEach(OrderTab.allCases) { tab in
                    VStack(alignment: .leading) {
                        Button(action: {
                            withAnimation(.easeInOut) {
                                viewModel.selectedTab = tab
                            }
                        }) {
                            Text(tab.rawValue)
                                .font(Font.Pretend.pretendardBold(size: 16))
                                .foregroundColor(viewModel.selectedTab == tab ? Color("black01") : Color("gray04"))
                            
                        }
                        .padding(.leading, 16)
                        .padding(.vertical, 13)
                        // 초록 막대기
                        if viewModel.selectedTab == tab {
                            Capsule()
                                .fill(Color.green)
                                .frame(height: 3)
                                .matchedGeometryEffect(id: "underline", in: animation)
                        } else {
                            Color.clear.frame(height: 3)
                        }
                    }
                    .padding(.bottom, -10)
                    
                    if tab == .my {
                        Spacer() // 원하는 만큼 간격 조절
                    }
                    
                }
                
                
            }
            .padding(.top)
            .shadow(color: Color.black.opacity(0.1), radius: 2, y: 1)
            
            ZStack(alignment: .leading) {
                // 항상 깔리는 회색 밑줄 (기기 전체 너비)
                Color.white.opacity(0.01)
                    .frame(height: 3)
                    .shadow(color: Color.black.opacity(30), radius: 2, y: 1)

                
            }
            .frame(height: 3)
        }
    }
}
    


#Preview {
    let vm = OrderViewModel()
    OrderTopTabView(viewModel: vm)
}
