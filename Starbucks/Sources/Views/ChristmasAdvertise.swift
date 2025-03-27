//
//  ChristmasAdvertise.swift
//  Starbucks
//
//  Created by 바견규 on 3/25/25.
//

import SwiftUI

struct ChristmasAdvertise: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Image("Christmas_Advertisement")
                .frame(maxWidth: .infinity)
                .frame(height: 720)
            
            Spacer()
            
                Button(action: {
                    print("자세히 보기")
                }, label: {
                    Text("자세히 보기")
                        .foregroundStyle(Color.white)
                        .frame(maxWidth: .infinity)
                        .font(Font.Pretend.pretendardMedium(size: 18))
                        .padding(.vertical, 19)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(hex: "#01A862"))
                        )
                })
                HStack{
                    Spacer()
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("X 닫기")
                            .foregroundStyle(Color(hex: "#6B6B6B"))
                            .font(Font.Pretend.pretendardLight(size: 14))
                    })
                }
            }
    }
}
#Preview {
        ChristmasAdvertise()
            .padding()
}

