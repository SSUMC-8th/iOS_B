//
//  MapView.swift
//  Starbucks
//
//  Created by 바견규 on 4/30/25.
//

import SwiftUI
import MapKit

// MARK: - EquatableCoordinate
struct EquatableCoordinate: Equatable {
    let latitude: Double
    let longitude: Double

    init(_ coordinate: CLLocationCoordinate2D) {
        self.latitude = coordinate.latitude
        self.longitude = coordinate.longitude
    }
}

// MARK: - MapView
struct MapView: View {
    @ObservedObject var viewModel: OrderViewModel
    @State private var mapRegion: MKCoordinateRegion
    @State private var showSearchButton: Bool = false
    @State private var lastCenter: EquatableCoordinate
    @State private var visibleStores: [Store] = []

    init(viewModel: OrderViewModel) {
        self.viewModel = viewModel
        let defaultLocation = viewModel.currentUserLocation
        let region = MKCoordinateRegion(
            center: defaultLocation.coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
        _mapRegion = State(initialValue: region)
        _lastCenter = State(initialValue: EquatableCoordinate(region.center))
        _visibleStores = State(initialValue: viewModel.stores.filter {
            $0.distance(from: CLLocation(latitude: region.center.latitude, longitude: region.center.longitude)) ?? .greatestFiniteMagnitude <= 10_000
        })
    }

    var body: some View {
        ZStack(alignment: .top) {
            Map(coordinateRegion: $mapRegion,
                showsUserLocation: true,
                annotationItems: visibleStores) { store in
                MapAnnotation(coordinate: store.location) {
                    Image("StarbucksPin")
                        .resizable()
                        .frame(width: 35, height: 42)
                }
            }
            .onChange(of: EquatableCoordinate(mapRegion.center)) { newCenter in
                if newCenter != lastCenter {
                    showSearchButton = true
                }
            }

            if showSearchButton {
                Button(action: {
                    // 필터링: 현재 카메라 중심 기준 10km 이내
                    visibleStores = viewModel.stores.filter {
                        let dist = $0.distance(from: CLLocation(latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)) ?? .greatestFiniteMagnitude
                        return dist <= 10_000
                    }
                    lastCenter = EquatableCoordinate(mapRegion.center)
                    showSearchButton = false
                }) {
                    Text("이 지역 검색")
                        .font(.caption)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                }
                .padding(.top, 16)
            }
        }
    }
    
}


