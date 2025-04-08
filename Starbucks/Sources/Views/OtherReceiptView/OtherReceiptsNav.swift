//
//  OtherReceiptsNav.swift
//  Starbucks
//
//  Created by 바견규 on 4/9/25.
//

import SwiftUI
import PhotosUI

struct OtherReceiptsNav: View {
    @ObservedObject private var viewModel: OtherReceiptViewModel
    init(viewModel: OtherReceiptViewModel) {
            self._viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    @State private var showCamera = false
    @State private var showActionSheet = false
    @State private var showPhotosPicker = false
    @State private var selectedItems: [PhotosPickerItem] = []
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        HStack {
            // 왼쪽 화살표
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .font(Font.Pretend.pretendardMedium(size: 19))
                    .padding(.leading, 16)
                    .foregroundStyle(Color.black)
            }
            
            Spacer()

            // 가운데 텍스트
            Text("전자영수증")
                .font(Font.Pretend.pretendardMedium(size: 16))
            
            Spacer()
            
            // 오른쪽 플러스
            Button(action: {
                showActionSheet = true
            }){
                Image(systemName: "plus")
                    .font(Font.Pretend.pretendardMedium(size: 19))
                    .padding(.trailing, 16)
                    .foregroundStyle(Color.black)
            }
        }
        .background(Color.white)
        // 사진 추가
        .confirmationDialog("사진을 어떻게 추가할까요?", isPresented: $showActionSheet, titleVisibility: .visible) {
                    Button("앨범에서 가져오기") {
                        showPhotosPicker = true
                    }

                    Button("카메라로 촬영하기") {
                        showCamera = true
                    }

                    Button("취소", role: .cancel) {}
                }
                .sheet(isPresented: $showCamera) {
                    CameraPicker { image in
                        viewModel.addReceipt(from: image)
                    }
                }
                .photosPicker(isPresented: $showPhotosPicker, selection: $selectedItems, maxSelectionCount: 5, matching: .images)
                .onChange(of: selectedItems) { oldItems, newItems in
                    for item in newItems {
                        Task {
                            if let data = try? await item.loadTransferable(type: Data.self),
                               let image = UIImage(data: data) {
                                viewModel.addReceipt(from:image)
                            }
                        }
                    }
                }
    }
}

#Preview {
}
