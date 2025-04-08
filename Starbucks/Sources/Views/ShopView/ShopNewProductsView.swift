//
//  ShopNewProductsView.swift
//  Starbucks
//
//  Created by 바견규 on 4/8/25.
//

import SwiftUI

struct ShopNewProductsView: View {
    let columnText = ["그린 사이렌 도트 머그 \n237ml","그린 사이렌 도트 머그 \n355ml","홈 카페 미니 머그 세트","홈 카페 글라스 세트"]
    let columns = [
        GridItem(.flexible(), spacing: 65),
        GridItem(.flexible(), spacing: 65)
    ]
    
    var body: some View {
        VStack(alignment: .leading){
            Text("New Products")
                .font(Font.Pretend.pretendardBold(size: 22))
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding()
            
            LazyVGrid(columns: columns) {
                ForEach(1..<5) { i in
                    SquareProductCard(imageName: "ShopNewProduct\(i)", text: columnText[i-1])
                }
            }
        }
    }
}

#Preview {
    ShopNewProductsView()
}
