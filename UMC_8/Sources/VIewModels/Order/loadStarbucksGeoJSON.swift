//
//  loadStarbucksGeoJSON.swift
//  Starbucks
//
//  Created by 소민준 on 4/30/25.
//
import SwiftUI
import CoreLocation

func loadStarbucksGeoJSON() -> [Store] {
    guard let url = Bundle.main.url(forResource: "스타벅스_2025 데이터", withExtension: "geojson"),
          let data = try? Data(contentsOf: url),
          let featureCollection = try? JSONDecoder().decode(GeoJSONFeatureCollection.self, from: data)
    else {
        print("GeoJSON 로딩 실패")
        return []
    }

    print("호출")

    var seen = Set<String>()  // 중복 제거용 Set
    var result: [Store] = []

    for feature in featureCollection.features {
        guard feature.geometry.type == "Point",
              feature.geometry.coordinates.count == 2 else {
            continue
        }

        let lon = feature.geometry.coordinates[0]
        let lat = feature.geometry.coordinates[1]
        let props = feature.properties

        let name = props.name
        let address = props.address ?? "주소 없음"
        let tel = props.tel ?? "전화번호 없음"
        let category = props.category ?? "분류 없음"

        let key = "\(name)-\(address)" // 중복 판단 기준

        if seen.contains(key) {
            continue
        }

        seen.insert(key)

        let store = Store(
            name: name,
            address: address,
            tel: tel,
            category: category,
            location: CLLocationCoordinate2D(latitude: lat, longitude: lon)
        )
        result.append(store)
    }

    return result
}



