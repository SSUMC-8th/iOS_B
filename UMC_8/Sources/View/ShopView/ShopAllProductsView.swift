//
//  ShopAllProductsView.swift
//  Starbucks
//
//  Created by 소민준 on 4/8/25.
//

import SwiftUI

struct ShopAllProductsView: View {
    let productsText:[String] = ["텀블러","커피 용품","선물세트", "보온병", "머그/컵", "라이프스타일"]
    var body: some View {
        
        VStack(alignment: .leading){
            Text("All Products")
                .font(Font.Pretend.pretendardBold(size: 22))
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding()
            ScrollView(.horizontal, showsIndicators: false){
                LazyHStack{
                    ForEach (1..<7) { index in
                        ShopProductCard(imageName: "ShopAllProduct\(index)", text: productsText[index-1])
                    }
                }
            }
            .frame(height: 108)
        }
        
    }
        
}


struct ShopProductCard: View {
    let imageName: String
    let text: String
    
    var body: some View {
        VStack{
            Image(imageName)
                .resizable()
                .frame(width: 80, height: 80)
            
            Text(text)
                .font(Font.Pretend.pretendardSemiBold(size: 13))
        }
        
    }
}

#Preview {
    ShopAllProductsView()
}
