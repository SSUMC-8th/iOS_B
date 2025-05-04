//
//  StoreRowView.swift
//  Starbucks
//
//  Created by 바견규 on 4/30/25.
//

import SwiftUI

struct StoreRowView: View {
    let store: Store
    let distance: Double?  // 현재는 nil로 사용됨
    let viewModel: OrderViewModel
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            // 이미지 자리 (향후 이미지 추가 시 대체 가능)
            Image("하기싫어")
                .resizable()
                .frame(width: 80, height: 80)

            VStack(alignment: .leading, spacing: 4) {
                Text(store.name)
                    .font(.headline)

                Text(store.address)
                    .font(.subheadline)
                    .foregroundColor(.gray)

                HStack(spacing: 4) {
                    ForEach(viewModel.categoryBadges(for: store.category), id: \.self) { badge in
                        if badge == "D"{
                            Image("DTBadge")
                        }else if badge == "R"{
                            Image("ReserveBadge")
                        }else{}
                    }
                }
            }

            Spacer()

            // 거리 정보는 nil이면 표시하지 않음
            if let distance = distance {
                Text(String(format: "%.1fkm", distance / 1000))
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 8)
    }

}


#Preview {
}
