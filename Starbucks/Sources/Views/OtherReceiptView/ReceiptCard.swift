//
//  ReceiptCard.swift
//  Starbucks
//
//  Created by 바견규 on 4/8/25.
//

import SwiftUI

struct ReceiptCard: View {
    var currentReceipt: OtherReceiptModel
    @State private var showImage = false // 이미지 보기용 상태 변수
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(currentReceipt.store)
                .padding(.horizontal)
                .font(Font.Pretend.pretendardSemiBold(size: 18))
            HStack {
                Text("\(currentReceipt.createdAt.formattedString())")
                    .font(Font.Pretend.pretendardMedium(size: 13))
                    .foregroundStyle(Color("gray03"))
                Spacer()
                Button(action: {
                    showImage = true
                }) {
                    Image("receiptIcon")
                }
                .sheet(isPresented: $showImage) {
                    if let uiImage = UIImage(data: currentReceipt.imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .padding()
                    } else {
                        Text("⚠️ 이미지를 불러올 수 없습니다.")
                    }
                }
            }
            .padding(.horizontal)
            Text("\(currentReceipt.totalPrice)원")
                .font(Font.Pretend.pretendardSemiBold(size: 18))
                .foregroundStyle(Color("brown02"))
                .padding()
        }
    }
}

#Preview {
    let sampleImage = UIImage(systemName: "doc.plaintext")!
    let imageData = sampleImage.jpegData(compressionQuality: 0.8)!

    let dummyReceipt = OtherReceiptModel(
        store: "테스트 카페",
        totalPrice: 6500,
        imageData: imageData
    )

    return ReceiptCard(currentReceipt: dummyReceipt)
}
