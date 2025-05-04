//
//  ShopBestItemsView.swift
//  Starbucks
//
//  Created by 바견규 on 4/8/25.
//

import SwiftUI

struct ShopBestItemsView: View {
    let columnText = [["그린 사이렌 슬리브 머그 \n355ml","그린 사이렌 클래식 머그 \n355ml","사이렌 머그 앤 우드 소서","리저브 골드 테일 머그 \n355ml"],["블랙 앤 골드 머그 473ml","블랙 링 머그 355ml","북청사자놀음 데미머그 \n89ml","서울 제주 데미머그 세트"]]
    let columns = [
        GridItem(.flexible(), spacing: 65),
        GridItem(.flexible(), spacing: 65)
    ]
    @State private var currentPage: Int = 0
    
    var body: some View {
        VStack{
            Text("New Products")
                .font(Font.Pretend.pretendardBold(size: 22))
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding()
            TabView(selection: $currentPage) {
                ForEach(0..<2, id: \.self){ pageIndex in
                    VStack(alignment: .leading){
                        
                        LazyVGrid(columns: columns) {
                            ForEach(1..<5) { i in
                                SquareProductCard(imageName: "ShopNewProduct\(i)", text: columnText[currentPage][i-1])
                            }
                        }
                    }
                    .tag(pageIndex)
                }
    
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .frame(height: 470)
            .padding()
            
            // 페이지 인디케이터
            HStack(spacing: 8) {
                ForEach(0..<2, id: \.self) { index in
                    Circle()
                        .fill(index == currentPage ? Color.black : Color.white)
                        .stroke(Color.black, lineWidth: 0.5)
                        .frame(width: 8, height: 8, alignment: .top)
                }
            }
            .padding(.top, 8)
            
        }
    }
}

#Preview {
    ShopBestItemsView()
}
