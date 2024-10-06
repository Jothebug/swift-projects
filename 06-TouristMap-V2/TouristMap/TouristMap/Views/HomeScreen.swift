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
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Test location")
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .overlay {
                            Image(systemName: "arrow.down")
                                .font(.headline)
                                .foregroundColor(.primary)
                                .padding()
                                .rotationEffect(Angle(degrees:180))
                        }
                })
            }
            .background(.thickMaterial)
            .cornerRadius(10)
            .shadow(
                color: Color.black.opacity(0.3), radius: 20,
                x: 0, y: 15
            )
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
}
