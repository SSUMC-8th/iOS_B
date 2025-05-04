//
//  StoreSelectBar.swift
//  Starbucks
//
//  Created by 소민준 on 4/30/25.
//

import SwiftUI

struct StoreSelectBar: View {
    @ObservedObject var vm:OrderViewModel

    var body: some View {
        VStack{
            HStack {
                Text("주문할 매장을 선택해 주세요")
                    .foregroundColor(.white)
                    .font(Font.Pretend.pretendardSemiBold(size: 16))
                Spacer()
                Button(action: {
                    // 화살표 버튼 액션
                    vm.isStoreSheetPresented = true
                }) {
                    Image(systemName: "chevron.down")
                        .foregroundColor(.white)
                }
            }
            Rectangle()
                .fill(Color("gray06"))
                .frame(height: 1)
        }
        .padding()
        .background(Color("black01"))
        .sheet(isPresented: $vm.isStoreSheetPresented) {
            StoreSheetView(viewModel: vm)
                .presentationDragIndicator(.visible)         // ⬆ 드래그 표시줄
        }
    }
}


#Preview {
    let vm = OrderViewModel()
    StoreSelectBar(vm: vm)
}
