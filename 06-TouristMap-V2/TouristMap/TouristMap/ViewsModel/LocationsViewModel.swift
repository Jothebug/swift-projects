//
//  LocationsViewModel.swift
//  TouristMap
//
//  Created by HaYen on 5/10/24.
//

import SwiftUI
import MapKit

class LocationsViewModel: ObservableObject {
    @Published var locations: [Location]
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var showListHeader: Bool = false
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    init() {
        let locations = DataLocations.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        }
    }
    
    func toggleList() {
        withAnimation(.easeInOut) {
            showListHeader = !showListHeader
        }
    }
}
