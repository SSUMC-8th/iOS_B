//
//  OrderViewModel.swift
//  Starbucks
//
//  Created by 바견규 on 4/30/25.
//

import SwiftUI
import CoreLocation

// MARK: - 더미 데이터
let dummyOrderDrinks: [OrderDrink] = [
    OrderDrink(name: "추천", englishName: "Recommend", imageName: "OrderDrink추천", dot: true),
    OrderDrink(name: "아이스 카페 아메리카노", englishName: "Reserve Espresso", imageName: "OrderDrink아이스카페아메리카노", dot: true),
    OrderDrink(name: "카페 아메리카노", englishName: "Reserve Drip", imageName: "OrderDrink카페아메리카노", dot: true),
    OrderDrink(name: "카푸치노", englishName: "Dcaf Coffee", imageName: "OrderDrink카푸치노", dot: false),
    OrderDrink(name: "아이스 카푸치노", englishName: "Espresso", imageName: "OrderDrink아이스카푸치노", dot: true),
    OrderDrink(name: "카라멜 마키아또", englishName: "Blonde Coffee", imageName: "OrderDrink카라멜마끼아또", dot: true),
    OrderDrink(name: "아이스 카라멜 마키아또", englishName: "Cold Brew", imageName: "OrderDrink아이스카라멜마끼아또", dot: true),
    OrderDrink(name: "아포가토/기타", englishName: "Others", imageName: "OrderDrink아포가토", dot: false),
    OrderDrink(name: "럼 샷 코르타도", englishName: "Brewed Coffee", imageName: "OrderDrink럼샷코르타도", dot: true),
    OrderDrink(name: "라벤더 카페 브레베", englishName: "Teavana", imageName: "OrderDrink라벤더카페브레베", dot: true),
    OrderDrink(name: "병음료", englishName: "RTD", imageName: "OrderDrink병음료", dot: false)
]


// MARK: - enum
enum OrderTab: String, CaseIterable, Identifiable {
    case all = "전체 메뉴"
    case my = "나만의 메뉴"
    case cake = "홀케이크 예약"

    var id: String { self.rawValue }
}

enum OrderTotalTab: String, CaseIterable, Identifiable {
    case drink = "음료"
    case food = "푸드"
    case product = "상품"

    var id: String { self.rawValue }
}

enum StoreTab: String, CaseIterable, Identifiable {
    case nearby = "가까운 매장"
    case frequent = "자주가는 매장"
    
    var id: String { self.rawValue }
}

// MARK: - viewModel
final class OrderViewModel: ObservableObject {
    @Published var stores: [Store] = []
    @Published var selectedTab: OrderTab = .all
    @Published var selectedTotalTab: OrderTotalTab = .drink
    @Published var isStoreSheetPresented = false
    @Published var StoreTab: StoreTab = .nearby //store 탭 
    @Published var isMapMode: Bool = false // 지도로 보일지 리스트로 보일지
    
    //
    var nearbyStores: [Store] {
        guard let userLocation = LocationManager.shared.currentLocation else {
            return stores // 위치 정보 없을 경우 정렬 없이 그대로
        }

        return stores.sorted {
            ($0.distance(from: userLocation) ?? .greatestFiniteMagnitude)
            <
            ($1.distance(from: userLocation) ?? .greatestFiniteMagnitude)
        }
    }
    
    // R / D 카테고리 뱃지 생성
    func categoryBadges(for category: String) -> [String] {
        var badges: [String] = []
        let normalized = category.uppercased()

        if normalized.contains("R") || normalized.contains("리저브") {
            badges.append("R")
        }

        if normalized.contains("DT") || normalized.contains("드라이브") {
            badges.append("D")
        }

        return badges
    }
    
    var currentUserLocation: CLLocation {
        LocationManager.shared.currentLocation ?? CLLocation(latitude: 37.5665, longitude: 126.9780) // 서울 시청
    }

    func searchStores(around center: CLLocationCoordinate2D) {
        let searchLocation = CLLocation(latitude: center.latitude, longitude: center.longitude)
        self.stores = loadStarbucksGeoJSON().filter {
            ($0.distance(from: searchLocation) ?? .greatestFiniteMagnitude) < 10000
        }
    }
    
    init() {
        self.stores = loadStarbucksGeoJSON()
    }
}

