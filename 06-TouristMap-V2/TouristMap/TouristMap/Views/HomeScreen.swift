//
//  HomeScreen.swift
//  TouristMap
//
//  Created by HaYen on 5/10/24.
//

import SwiftUI
import MapKit

struct HomeScreen: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        ZStack {
            Map(
                coordinateRegion: $vm.mapRegion,
                annotationItems: vm.locations,
                annotationContent: { location in
                    MapAnnotation(coordinate: location.coordinates) {
                        LocationAnnotation()
                            .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                    }
                })
                .ignoresSafeArea()
        }
    }
}

#Preview {
    HomeScreen()
        .environmentObject(LocationsViewModel())
}
