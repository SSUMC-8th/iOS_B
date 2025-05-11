import SwiftUI
import MapKit

struct OrderView: View {
    @StateObject private var locationManager = LocationManager()
    @State private var stores: [StoreModel] = []
    @State private var showMap = false
    @State private var selectedTab: Tab = .nearby

    enum Tab {
        case nearby, favorites
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                HStack {
                    Spacer()
                    Text("매장 설정")
                        .font(.title2.bold())
                        .frame(alignment: .center)
                    Spacer()
                    Button(action: {
                        withAnimation {
                            showMap.toggle()
                        }
                    }) {
                        Image(systemName: showMap ? "list.bullet" : "map")
                            .font(.title2)
                            .foregroundColor(.green)
                    }
                }
                .padding(.horizontal, 16)

                TextField("검색", text: .constant(""))
                    .padding(10)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .padding(.horizontal, 16)

                HStack(spacing: 8) {
                    Spacer()
                    Button(action: { selectedTab = .nearby }) {
                        Text("가까운 매장")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(selectedTab == .nearby ? .green : .gray)
                    }
                    Spacer()
                    Divider()
                        .frame(height: 16)
                    Spacer()
                    Button(action: { selectedTab = .favorites }) {
                        Text("자주 가는 매장")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(selectedTab == .favorites ? .green : .gray)
                    }
                    Spacer()
                }
                .padding(.horizontal, 16)

                Divider()

                if showMap {
                    ZStack {
                        Map(coordinateRegion: $locationManager.region, annotationItems: stores) { store in
                            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: store.latitude, longitude: store.longitude)) {
                                Image(systemName: "mappin.circle.fill")
                                    .font(.title)
                                    .foregroundColor(.green)
                            }
                        }
                        .onChange(of: locationManager.region.center) { _ in
                            locationManager.didRegionChange = true
                        }

                        if locationManager.didRegionChange {
                            VStack {
                                Spacer()
                                Button(action: {
                                    searchNearby(center: locationManager.region.center)
                                }) {
                                    Text("이 지역 검색")
                                        .padding()
                                        .background(Color.white)
                                        .cornerRadius(12)
                                        .shadow(radius: 3)
                                }
                                .padding(.bottom, 16)
                            }
                        }
                    }
                } else {
                    List(stores) { store in
                        HStack(alignment: .center, spacing: 12) {
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 60, height: 60)
                                .cornerRadius(8)

                            VStack(alignment: .leading, spacing: 6) {
                                Text(store.name)
                                    .font(.headline)
                                Text(store.address)
                                    .font(.caption)
                                    .foregroundColor(.gray)

                                HStack {
                                    if store.category == .reserve {
                                        Text("R")
                                            .font(.caption2)
                                            .padding(4)
                                            .background(Color.yellow.opacity(0.7))
                                            .cornerRadius(4)
                                    }
                                    if store.category == .dt {
                                        Text("D")
                                            .font(.caption2)
                                            .padding(4)
                                            .background(Color.green.opacity(0.7))
                                            .cornerRadius(4)
                                    }
                                }
                            }
                            Spacer()
                            if let distance = store.distance {
                                Text(String(format: "%.1fkm", distance / 1000))
                                    .font(.footnote)
                                    .frame(width: 60, alignment: .trailing)
                            } else {
                                Text("-")
                                    .font(.footnote)
                                    .frame(width: 60, alignment: .trailing)
                            }
                        }
                        .padding(.vertical, 6)
                    }
                    .listStyle(.plain)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    loadStores()
                }
            }
        }
    }

    private func loadStores() {
        stores = StoreParser.loadStores()

        let baseLocation: CLLocation
        if let userLoc = locationManager.userLocation {
            baseLocation = CLLocation(latitude: userLoc.latitude, longitude: userLoc.longitude)
        } else {
            baseLocation = CLLocation(latitude: 37.4959855, longitude: 126.9572031)
        }

        for i in stores.indices {
            let storeLoc = CLLocation(latitude: stores[i].latitude, longitude: stores[i].longitude)
            stores[i].distance = baseLocation.distance(from: storeLoc)
        }
        stores = stores.filter { ($0.distance ?? 0) < 100000 } // 100km 이하만
        stores.sort { ($0.distance ?? 0) < ($1.distance ?? 0) }
    }

    private func searchNearby(center: CLLocationCoordinate2D) {
        let newCenterLoc = CLLocation(latitude: center.latitude, longitude: center.longitude)
        stores = StoreParser.loadStores().compactMap { store in
            let storeLoc = CLLocation(latitude: store.latitude, longitude: store.longitude)
            let distance = newCenterLoc.distance(from: storeLoc)
            var updatedStore = store
            updatedStore.distance = distance
            return distance < 100000 ? updatedStore : nil
        }
        stores.sort { ($0.distance ?? 0) < ($1.distance ?? 0) }
        locationManager.didRegionChange = false
    }
}
