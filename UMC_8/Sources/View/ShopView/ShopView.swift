//
//  ShopView.swift
//  Starbucks
//
//  Created by 소민준 on 4/8/25.
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
