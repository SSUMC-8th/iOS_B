import Foundation
import CoreLocation

struct StoreModel: Identifiable, Codable {
    let id = UUID()
    let name: String
    let address: String
    let latitude: Double
    let longitude: Double
    var distance: Double? = nil
    let category: StoreCategory
    var imageName: String? = nil

    enum StoreCategory: String, Codable {
        case reserve = "RESERVE"
        case dt = "DT"
        case none = "NONE"
    }
}
