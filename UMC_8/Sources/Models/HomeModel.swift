//
//  HomeModel.swift
//  Starbucks
//
//  Created by 소민준 on 4/1/25.
//

import Foundation

struct HomeModel {
    var nickname: String
    var userUUID: UUID
}

struct userRecommendModel: Identifiable {
    var id: UUID = UUID()        // UUID 자동 생성 (직접 설정도 가능)
    var menuName: String
    var menuImage: String
    let coffees: OrderMenuModel
    
    
    init(id: UUID = UUID(), menuName: String, menuImage: String, coffees: OrderMenuModel) {
        self.id = id
        self.menuName = menuName
        self.menuImage = menuImage
        self.coffees = coffees
    }
}

struct userBreadModel: Identifiable {
    var id: UUID = UUID()        // UUID 자동 생성 (직접 설정도 가능)
    var menuName: String
    var menuImage: String
    
    
    init(id: UUID = UUID(), menuName: String, menuImage: String) {
        self.id = id
        self.menuName = menuName
        self.menuImage = menuImage
    }
}



struct WhatsNewModel: Identifiable {
    var id: UUID = UUID()        // UUID 자동 생성 (직접 설정도 가능)
    var NewsName: String
    var NewsContent: String
    var NewsImage: String
    
    
    init(id: UUID = UUID(), NewsName: String, NewsContent: String, NewsImage: String) {
        self.id = id
        self.NewsName = NewsName
        self.NewsContent = NewsContent
        self.NewsImage = NewsImage
    }
}
