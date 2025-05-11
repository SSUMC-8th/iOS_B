//
//  ProductCard.swift
//  Starbucks
//
//  Created by 소민준 on 4/8/25.
//

import SwiftUI

struct ProductCard: View {
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
}
