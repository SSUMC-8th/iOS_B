import Foundation

struct StoreParser {
    static func loadStores() -> [StoreModel] {
        guard let url = Bundle.main.url(forResource: "스타벅스_2025 데이터", withExtension: "geojson"),
              let data = try? Data(contentsOf: url),
              let geoJSON = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
              let features = geoJSON["features"] as? [[String: Any]] else {
            print("⚠️ GeoJSON 로드 실패")
            return []
        }

        var stores: [StoreModel] = []

        for feature in features {
            guard let properties = feature["properties"] as? [String: Any],
                  let geometry = feature["geometry"] as? [String: Any],
                  let coordinates = geometry["coordinates"] as? [Double],
                  coordinates.count >= 2 else {
                continue
            }

            let longitude = coordinates[0]
            let latitude = coordinates[1]
            let name = properties["Sotre_nm"] as? String ?? "이름 없음"
            let address = properties["Address"] as? String ?? "주소 없음"
            let categoryText = (properties["Category"] as? String ?? "").uppercased()

            let category: StoreModel.StoreCategory
            if categoryText.contains("리저브") {
                category = .reserve
            } else if categoryText.contains("DT") {
                category = .dt
            } else {
                category = .none
            }

            let store = StoreModel(
                name: name,
                address: address,
                latitude: latitude,
                longitude: longitude,
                category: category
            )
            stores.append(store)
        }

        print("총 로드된 매장 수: \(stores.count)")
        return stores
    }
}
