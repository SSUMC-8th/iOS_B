//
//  SquareProductCard.swift
//  Starbucks
//
//  Created by 소민준 on 4/8/25.
//

import SwiftUI

struct SquareProductCard: View {
    let imageName: String
    let text: String
    
    var body: some View {
        VStack{
            Image(imageName)
                .resizable()
                .frame(width: 157, height: 156)
                .cornerRadius(5)
                .aspectRatio(contentMode: .fit)
            
            Spacer().frame(height: 12)
            
            Text(text)
                .font(Font.Pretend.pretendardSemiBold(size: 14))
                .frame(width: 157, alignment:.leading)
        }
        
    }
}

#Preview {
    SquareProductCard(imageName: "ShopNewProduct1", text: "그린 사이렌 도트 머그 \n237ml")
}
