//
//  ShopWhatsNewBannersView.swift
//  Starbucks
//
//  Created by 소민준 on 4/8/25.
//

import SwiftUI

struct ShopWhatsNewBannersView: View {
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Starbucks Online Store")
                .font(Font.Pretend.pretendardBold(size: 24))
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding()
            ScrollView(.horizontal, showsIndicators: false){
                LazyHStack{
                ForEach (1..<4) { index in
                        Image("ShopWhatsNew\(index)")
                            .resizable()
                            .frame(width: 270, height: 216)
                            .padding(.horizontal)

                    }
                }
            }
            .frame(height: 216)
        }
        
    }
}

#Preview {
    ShopWhatsNewBannersView()
}
