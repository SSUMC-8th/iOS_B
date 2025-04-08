//
//  HomeViewModel.swift
//  UMC_8
//
//  Created by 소민준 on 4/2/25.
//

import Foundation



class RecommendMenuViewModel: ObservableObject {
    @Published var recommendMenus: [userRecommendModel] = [
        userRecommendModel(menuName: "에스프레소 콘파나", menuImage: "espressoConpana",coffees: OrderMenuModel(
            hot: CoffeeVariant(
                menuName: "에스프레소 콘 파나",
                enMenuName: "Espresso Con Panna",
                imageName: "confana",
                description: "신선한 에스프레소 샷에 풍부한 휘핑크림을 얹은 커피 음료로서, 뜨거운 커피의 맛과 차갑고 달콤한 생크림의 맛을 같이 즐길 수 있는 커피 음료",
                price: "4100원"
            ),
            iced: CoffeeVariant(
                menuName: "에스프레소 콘 파나",
                enMenuName: "Espresso Con Panna",
                imageName: "confana",
                description: "신선한 에스프레소 샷에 풍부한 휘핑크림을 얹은 커피 음료로서, 뜨거운 커피의 맛과 차갑고 달콤한 생크림의 맛을 같이 즐길 수 있는 커피 음료",
                price: "4100원"
            ),
            selectedTemp: .hot,tempOption: .hotOnly
        )),
        userRecommendModel(menuName: "에스프레소 마키아또", menuImage: "espressoMakiatto",coffees: OrderMenuModel(
            hot: CoffeeVariant(
                menuName: "에스프레소 마끼아또",
                enMenuName: "Espresso Macchiato",
                imageName: "machiatto",
                description: "신선한 에스프레소 샷에 우유 거품을 살짝 얹은 커피 음료로서, 강렬한 에스프레소의 맛과 우유의 부드러움을 같이 즐길 수 있는 커피 음료",
                price: "3900원"
            ),
            iced: CoffeeVariant(
                menuName: "에스프레소 마끼아또",
                enMenuName: "Espresso Macchiato",
                imageName: "macchiato",
                description: "신선한 에스프레소 샷에 우유 거품을 살짝 얹은 커피 음료로서, 강렬한 에스프레소의 맛과 우유의 부드러움을 같이 즐길 수 있는 커피 음료",
                price: "3900원"
            ),
            selectedTemp: .iced,tempOption: .icedOnly
        )),
        userRecommendModel(menuName: "아이스 카페 아메리카노", menuImage: "iceAmericano",coffees:OrderMenuModel(
            hot: CoffeeVariant(
                menuName: "카페 아메리카노",
                enMenuName: "Caffe Americano",
                imageName: "americanoHot",
                description: "진한 에스프레소와 뜨거운 물을 섞어 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽게 잘 느낄 수 있는 커피",
                price: "4700원"
            ),
            iced: CoffeeVariant(
                menuName: "아이스 카페 아메리카노",
                enMenuName: "Iced Caffe Americano",
                imageName: "americanpCold",
                description: "진한 에스프레소에 시원한 정수물과 얼음을 더하여 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽고 시원하게 즐길 수 있는 커피",
                price: "4700원"
            ),
            selectedTemp: .iced, tempOption: .both)),
        userRecommendModel(menuName: "카페 아메리카노", menuImage: "Americano",coffees:OrderMenuModel(
            hot: CoffeeVariant(
                menuName: "카페 아메리카노",
                enMenuName: "Caffe Americano",
                imageName: "americanoHot",
                description: "진한 에스프레소와 뜨거운 물을 섞어 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽게 잘 느낄 수 있는 커피",
                price: "4700원"
            ),
            iced: CoffeeVariant(
                menuName: "아이스 카페 아메리카노",
                enMenuName: "Iced Caffe Americano",
                imageName: "americanpCold",
                description: "진한 에스프레소에 시원한 정수물과 얼음을 더하여 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽고 시원하게 즐길 수 있는 커피",
                price: "4700원"
            ),
            selectedTemp: .hot, tempOption: .both)),
        userRecommendModel(menuName: "아이스 카라멜 마키아또", menuImage: "iceCaramelMakiatto",coffees: OrderMenuModel(
            hot: CoffeeVariant(
                menuName: "카라멜 마끼아또",
                enMenuName: "Caramel Macchiato",
                imageName: "CaramelHot",
                description: "향긋한 바닐라 시럽과 따뜻한 스팀 밀크 위에 풍성한 우유 거품을 얹고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료",
                price: "6100원"
            ),
            iced: CoffeeVariant(
                menuName: "아이스 카라멜 마끼아또",
                enMenuName: "Iced Caramel Macchiato",
                imageName: "caramerlCold",
                description: "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료",
                price: "6100원"
            ),
            selectedTemp: .iced, tempOption: .both
        )),
        userRecommendModel(menuName: "카라멜 마키아또", menuImage: "CaramelMakiatto",coffees: OrderMenuModel(
            hot: CoffeeVariant(
                menuName: "카라멜 마끼아또",
                enMenuName: "Caramel Macchiato",
                imageName: "CaramelHot",
                description: "향긋한 바닐라 시럽과 따뜻한 스팀 밀크 위에 풍성한 우유 거품을 얹고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료",
                price: "6100원"
            ),
            iced: CoffeeVariant(
                menuName: "아이스 카라멜 마끼아또",
                enMenuName: "Iced Caramel Macchiato",
                imageName: "caramerlCold",
                description: "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료",
                price: "6100원"
            ),
            selectedTemp: .hot, tempOption: .both
        ))
    ]
    
    @Published var recommendBreads: [userBreadModel] = [
        userBreadModel(menuName: "너티 크루아상", menuImage: "NirtyCrr"),
        userBreadModel(menuName: "매콤 소시지 불고기", menuImage: "sausagebulgogi"),
        userBreadModel(menuName: "미니 리프 파이", menuImage: "minileafpie"),
        userBreadModel(menuName: "뺑 오 쇼콜라", menuImage: "bangOshocola"),
        userBreadModel(menuName: "소시지&올리브 파이", menuImage: "sausageOlivePie"),
    ]
}


class WhatsNewViewModel: ObservableObject {
    @Published var News: [WhatsNewModel] = [
        WhatsNewModel(NewsName: "25년 3월 일회용컵 없는 날 캠페..", NewsContent: "매월 10일은 일회용컵 없는 날! 스타벅스 에모매장에서 개인컵 및 다회용 컵을 이용하세요.", NewsImage: "NoDisposableCupDay"),
        WhatsNewModel(NewsName: "스타벅스 ooo점을 찾습니다", NewsContent: "스타벅스 커뮤니티 스토어 파트너를 웅영할 기관을 공모합니다.", NewsImage: "NewOranizationRecruit"),
        WhatsNewModel(NewsName: "2월 8일, 리저브 스프링 신규 커...", NewsContent: "산뜻하고 달콤한 풍미가 가득한 리저브를 맛보세요.", NewsImage: "NewReserveCoffe")
    ]
}

