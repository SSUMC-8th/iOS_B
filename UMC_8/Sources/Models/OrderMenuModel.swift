//
//  OrderMenuModel.swift
//  Starbucks
//
//  Created by 소민준 on 4/2/25.
//

import Foundation


enum CoffeeTemperature: String, CaseIterable {
    case hot = "HOT"
    case iced = "ICED"
}

enum CoffeeTemperatureOption {
    case both
    case hotOnly
    case icedOnly
}

struct CoffeeVariant {
    var menuName: String
    var enMenuName: String
    var imageName: String
    var description: String
    var price: String
}


struct OrderMenuModel: Identifiable {
    var hot: CoffeeVariant
    var iced: CoffeeVariant
    var selectedTemp: CoffeeTemperature
    var tempOption: CoffeeTemperatureOption
    var id:UUID = UUID()
}

