//
//  OrderTotalDrinkView.swift
//  Starbucks
//
//  Created by 소민준 on 4/30/25.
//

import SwiftUI

struct DrinkListView: View {
    let drinks: [OrderDrink]

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 20) {
                ForEach(drinks) { drink in
                    HStack(spacing: 16) {
                        Image(drink.imageName)
                            .resizable()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            ZStack(alignment: .topTrailing) {
                                Text(drink.name)
                                    .font(Font.Pretend.pretendardSemiBold(size: 16))
                                    .foregroundColor(Color("gray06"))
                                
                                if drink.dot {
                                    Circle()
                                        .fill(Color.green)
                                        .frame(width: 6, height: 6)
                                        .offset(x: 6, y: -6)
                                }
                            }
                            Text(drink.englishName)
                                .font(Font.Pretend.pretendardSemiBold(size:13))
                                .foregroundColor(Color("gray03"))
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.top)
        }
    }
}

#Preview {
    DrinkListView(drinks: dummyOrderDrinks)
}
