//
//  OrderDrinkModel.swift
//  Starbucks
//
//  Created by 바견규 on 4/30/25.
//


import SwiftUI

struct OrderDrink: Identifiable {
    let id = UUID()
    let name: String
    let englishName: String
    let imageName: String
    let dot:Bool
}
