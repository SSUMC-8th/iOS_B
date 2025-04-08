//
//  ShopView.swift
//  Starbucks
//
//  Created by 바견규 on 4/8/25.
//

import SwiftUI

struct ShopView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ShopWhatsNewBannersView()
            ShopAllProductsView()
            ShopBestItemsView()
            ShopNewProductsView()
        }
        
    }
}

#Preview {
    ShopView()
}
