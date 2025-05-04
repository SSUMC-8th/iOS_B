//
//  OrderTotalTabView.swift
//  Starbucks
//
//  Created by 소민준 on 4/30/25.
//

import SwiftUI

struct OrderTotalTabView: View {
    @ObservedObject var viewModel: OrderViewModel

    var body: some View {
        VStack{
            HStack() {
                Spacer().frame(width: 23)
                ForEach(OrderTotalTab.allCases) { tab in
                    VStack(alignment: .leading) {
                        Button(action: {
                            viewModel.selectedTotalTab = tab
                        }) {
                            Text(tab.rawValue)
                                .font(Font.Pretend.pretendardSemiBold(size: 16))
                                .foregroundColor(viewModel.selectedTotalTab == tab ? Color("black01") : Color("gray04"))
                            Image("new")
                            
                        }
                        .padding(.horizontal)
                    }
                }
                Spacer()
            }
         Divider()
        }
        
    }
}

#Preview {
    let vm = OrderViewModel()
    OrderTotalTabView(viewModel: vm)
}
