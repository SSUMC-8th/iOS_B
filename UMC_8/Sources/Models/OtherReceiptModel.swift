//
//  OtherReceiptModel.swift
//  Starbucks
//
//  Created by 소민준 on 4/8/25.
//

import SwiftUI
import SwiftData

@Model
class OtherReceiptModel {
    @Attribute(.unique) var id = UUID()
    var store: String // 위치
    var totalPrice: Int //총 가격
    var createdAt: Date // 저장된 시점
    var imageData: Data
    var image: UIImage? {
            UIImage(data: imageData)
    }
    
    init(
        store: String,
        totalPrice:Int,
        imageData: Data,
        createdAt: Date = Date()
    ){
        self.store = store
        self.totalPrice = totalPrice
        self.imageData = imageData
        self.createdAt = createdAt
    }
}
