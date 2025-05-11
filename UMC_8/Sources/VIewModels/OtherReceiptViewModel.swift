//
//  OtherReceiptViewModel.swift
//  Starbucks
//
//  Created by 소민준 on 4/8/25.
//

import SwiftUI
import Vision
import SwiftData


class OtherReceiptViewModel: ObservableObject {
    private let modelContext: ModelContext // 뷰에서만 @Environment(\.modelContext) private var modelContext 사용가능 그러므로 뷰에서 주입

    @Published var currentReceipt: OtherReceiptModel?
    @Published var receipts: [OtherReceiptModel]

    func addReceipt(from image: UIImage) {
        performOCR(on: image)
    }

    private func performOCR(on uiImage: UIImage) {
        guard let cgImage = uiImage.cgImage else { return }

        let request = VNRecognizeTextRequest { [weak self] request, error in
            guard let self = self,
                  let observations = request.results as? [VNRecognizedTextObservation],
                  error == nil else { return }

            let recognizedStrings = observations.compactMap { $0.topCandidates(1).first?.string }
            let fullText = recognizedStrings.joined(separator: "\n")
            let (store, price) = self.parseWithoutRegex(from: fullText)

            DispatchQueue.main.async {
                guard let imageData = uiImage.jpegData(compressionQuality: 0.8) else {
                        print("⚠️ 이미지가 없거나 JPEG 데이터 변환에 실패했습니다.")
                        return
                }
                let receipt = OtherReceiptModel(store: store, totalPrice: price, imageData: imageData)
                self.modelContext.insert(receipt)
                self.receipts.append(receipt)
                self.currentReceipt = receipt
                let (store, price) = self.parseWithoutRegex(from: fullText)
                print("📄 추출된 장소: \(store), 금액: \(price)")

            }
        }

        request.recognitionLevel = .accurate
        request.recognitionLanguages = ["ko-KR", "en-US"]

        DispatchQueue.global(qos: .userInitiated).async {
            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            try? handler.perform([request])
        }
    }

    private func parseWithoutRegex(from text: String) -> (String, Int) {
        let lines = text.components(separatedBy: .newlines)
        
        var store = "장소 없음"
        var totalPrice = 0
        var i = 0

        while i < lines.count {
            let trimmed = lines[i].trimmingCharacters(in: .whitespacesAndNewlines)
            print("🔹 [\(i)] \(trimmed)")

            // 장소 추정
            if store == "장소 없음", trimmed.contains("점") {
                store = "스타벅스 " + trimmed
            }

            // 결제 금액 추정
            if trimmed.contains("결제금액"), i + 2 < lines.count {
                let priceLine = lines[i + 2].trimmingCharacters(in: .whitespaces)
                let numberOnly = priceLine.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
                if let amount = Int(numberOnly) {
                    totalPrice = amount
                }
            }
            
            // 결제 금액 추정2
            if trimmed.lowercased() == "total" {
                for offset in 1...5 {
                    let nextIndex = i + offset
                    if nextIndex < lines.count {
                        let priceLine = lines[nextIndex].trimmingCharacters(in: .whitespacesAndNewlines)
                        let cleaned = priceLine.replacingOccurrences(of: ",", with: "")
                        if let amount = Int(cleaned) {
                            totalPrice = amount
                            print("💰 'Total' 이후 줄에서 금액 추출됨: \(totalPrice)")
                            break
                        } else {
                            print("❌ 금액 파싱 실패 (시도): \(priceLine)")
                        }
                    }
                }
            }

            i += 1 // 반드시 증가시켜야 루프 빠져나옴
        }
            
        return (store, totalPrice)
    }

    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        self.receipts = []
        self.currentReceipt = nil
    }

}



