//
//  ADView.swift
//  UMC_8
//
//  Created by 소민준 on 3/30/25.
//

import SwiftUI

struct ADView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 20) {
            Image("Christmas_Advertisement")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .frame(height: 720)
                .clipped()

            Spacer()

            Button(action: {
                print("자세히 보기")
            }) {
                Text("자세히 보기")
                    .foregroundStyle(Color.white)
                    .font(Font.PretendardMedium18)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 19)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.black)
                    )
            }

            HStack {
                Spacer()
                Button(action: {
                    dismiss()
                }) {
                    Text("X 닫기")
                        .foregroundStyle(Color(hex: "#6B6B6B"))
                        .font(Font.PretendardLight14)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ADView()
}
