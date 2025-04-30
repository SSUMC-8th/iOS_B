//
//  MapDataModel.swift
//  Starbucks
//
//  Created by 바견규 on 4/30/25.
//
import SwiftUI
import CoreLocation

struct GeoJSONFeatureCollection: Codable {
    let type: String
    let features: [GeoJSONFeature]
}

struct GeoJSONFeature: Codable {
    let type: String
    let properties: StoreProperties
    let geometry: Geometry
}

struct StoreProperties: Codable {
    let name: String
    let address: String?
    let tel: String?
    let category: String?

    enum CodingKeys: String, CodingKey {
        case name = "Sotre_nm"       // ✅ JSON 실제 키와 정확히 맞춰야 함
        case address = "Address"
        case tel = "Telephone"
        case category = "Category"
    }
}


struct Geometry: Codable {
    let type: String
    let coordinates: [Double]
}

struct Store: Identifiable {
    var id: String { "\(name)-\(address)" }
    let name: String
    let address: String
    let tel: String
    let category: String
    let location: CLLocationCoordinate2D
    
    
    func distance(from location: CLLocation?) -> CLLocationDistance? {
        guard let location else { return nil }
        let storeLocation = CLLocation(latitude: self.location.latitude, longitude: self.location.longitude)
        return location.distance(from: storeLocation)
    }
    
    
}


