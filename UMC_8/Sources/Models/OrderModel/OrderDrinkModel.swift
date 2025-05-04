//
//  OrderDrinkModel.swift
//  Starbucks
//
//  Created by 소민준 on 4/30/25.
//


import SwiftUI

struct OrderDrink: Identifiable {
    let id = UUID()
    let name: String
    let englishName: String
    let imageName: String
    let dot:Bool
}
