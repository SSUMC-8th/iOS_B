//
//  OrderTotalView.swift
//  Starbucks
//
//  Created by 소민준 on 4/30/25.
//

import SwiftUI

struct OrderTotalView: View {
    @StateObject var vm = OrderViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            OrderTopTabView(viewModel: vm)

            if vm.selectedTab == .all {
                OrderTotalTabView(viewModel: vm)
                    .padding(.top)

                if vm.selectedTotalTab == .drink {
                    DrinkListView(drinks: dummyOrderDrinks)
                }
            }
            
            StoreSelectBar(vm: vm)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(.top)
    }
}

#Preview {
    OrderTotalView()
}
