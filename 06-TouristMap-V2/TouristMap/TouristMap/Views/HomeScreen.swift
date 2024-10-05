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
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    HomeScreen()
        .environmentObject(LocationsViewModel())
}
