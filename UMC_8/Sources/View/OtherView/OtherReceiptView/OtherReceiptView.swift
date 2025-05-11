    //
    //  OtherReceiptView.swift
    //  Starbucks
    //
    //  Created by 소민준 on 4/8/25.
    //

    import SwiftUI
    import SwiftData



    struct OtherReceiptView: View {
        @StateObject private var viewModel: OtherReceiptViewModel
        init(modelContext: ModelContext) {
            _viewModel = StateObject(wrappedValue: OtherReceiptViewModel(modelContext: modelContext))
        }
        
        var body: some View {
            VStack {
                OtherReceiptsNav(viewModel: viewModel)
                ZStack(alignment: .top) {
                    Color(hex: "#F8F8F8")
                    ReceiptsView(viewModel: viewModel)
                }
            }
            .navigationBarBackButtonHidden(true)
            .frame(maxHeight: .infinity, alignment: .top)
        }
    }

    struct ReceiptsView: View {
        @ObservedObject private var viewModel: OtherReceiptViewModel
        init(viewModel: OtherReceiptViewModel) {
                self._viewModel = ObservedObject(wrappedValue: viewModel)
        }
        
        var body: some View {
            VStack(alignment: .leading){
                HStack{
                    Text("총")
                        .font(Font.Pretend.pretendardMedium(size: 18)) +
                    Text(" \(viewModel.receipts.count)건")
                        .font(Font.Pretend.pretendardMedium(size: 18))
                        .foregroundStyle(Color("brown02"))
                    
                    Spacer()
                    Text("사용합계")
                        .font(Font.Pretend.pretendardMedium(size: 18)) +
                    Text(" \(viewModel.receipts.reduce(0) { $0 + $1.totalPrice })")
                        .font(Font.Pretend.pretendardMedium(size: 18))
                        .foregroundStyle(Color("brown02"))
                }
                .padding()
                

                ForEach (viewModel.receipts) { receipt in
                    ScrollView {
                        LazyVStack {
                            ReceiptCard(currentReceipt: receipt)
                            Divider()
                                .background(Color("gray03"))
                        }
                    }
                }
            }
        }
    }


#Preview { // Receipts Preview
        // 샘플 이미지 생성
        let sampleImage = UIImage(systemName: "doc.plaintext")!
        let imageData = sampleImage.jpegData(compressionQuality: 0.8)!

        // 더미 영수증 생성
        let dummy1 = OtherReceiptModel(store: "스타벅스 강남점", totalPrice: 6500, imageData: imageData)
        let dummy2 = OtherReceiptModel(store: "메가커피 역삼", totalPrice: 4200, imageData: imageData)

        do {
            // 인메모리 ModelContainer 생성
            let container = try ModelContainer(for: OtherReceiptModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
            let context = ModelContext(container)

            // 더미 데이터 삽입
            context.insert(dummy1)
            context.insert(dummy2)

        // OtherReceiptView에 context 전달
        return OtherReceiptView(modelContext: context)
        } catch {
            return Text("⚠️ Preview 실패: \(error.localizedDescription)")
        }
}

