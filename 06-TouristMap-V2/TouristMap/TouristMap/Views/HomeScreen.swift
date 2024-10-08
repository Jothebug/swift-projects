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
            mapLayer.ignoresSafeArea()
            VStack {
                mapHeader
                Spacer()
                LocationPreview()
            }
        }
    }
}

#Preview {
    HomeScreen()
        .environmentObject(LocationsViewModel())
}

extension HomeScreen {
    private var mapLayer: some View {
        Map(
            coordinateRegion: $vm.mapRegion,
            annotationItems: vm.locations,
            annotationContent: { location in
                MapAnnotation(coordinate: location.coordinates) {
                    LocationAnnotation()
                        .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                }
            })
    }
    
    private var mapHeader: some View {
        VStack(spacing: 0) {
            Button(action: vm.toggleList, label: {
                Rectangle()
                    .fill(.thinMaterial)
                    .frame(height: 55)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .overlay(alignment: .leading) {
                        HStack(spacing: 0) {
                            Image(systemName: "arrow.down")
                                .font(.headline)
                                .foregroundColor(.primary)
                                .rotationEffect(Angle(degrees: vm.showListHeader ? 180 : 0 ))
                            Spacer()
                            Text("\(vm.mapLocation.name), \(vm.mapLocation.cityName)")
                                .font(.title2)
                                .fontWeight(.black)
                                .foregroundColor(.primary)
                            Spacer()
                        }
                        .padding(.horizontal, 15)
                    }
                    .shadow(
                        color: Color.black.opacity(0.3),
                        radius: 20,
                        x: 0, y: 15
                    )
            })
            .buttonStyle(NoPressEffectButtonStyle())
            if vm.showListHeader {
                LocationsList()
            }
        }
    }
}
