//
//  LocationPreview.swift
//  TouristMap
//
//  Created by HaYen on 8/10/24.
//

import SwiftUI

struct LocationPreview: View {
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        ZStack {
            ForEach(vm.locations) { location in
                if vm.mapLocation == location {
                    renderCard
                }
            }
        }
    }
}

#Preview {
    ZStack {
        Color.blue.ignoresSafeArea()
        LocationPreview()
    }
    .environmentObject(LocationsViewModel())
    
}

extension LocationPreview {
    private var renderCard: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                renderAvatar
                renderLocationName
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            VStack {
                renderLearnMore
                renderNextButton
            }
        }
        .padding(15)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 50)
        )
        .cornerRadius(10)
        .transition(.asymmetric(
            insertion: .move(edge: .trailing),
            removal: .move(edge: .leading)))
    }
    
    private var renderAvatar: some View {
        Rectangle()
            .fill(.white)
            .frame(width: 112, height: 112)
            .cornerRadius(10)
            .overlay(alignment: .center) {
                if let imageName = vm.mapLocation.imageNames.first {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                }
            }
    }
    
    private var renderLocationName: some View {
        VStack(alignment: .leading) {
            Text("\(vm.mapLocation.name)")
                .font(.title2)
                .fontWeight(.bold)
            Text("\(vm.mapLocation.cityName)")
                .font(.subheadline)
        }
    }
    
    private var renderLearnMore: some View {
        Button (
            action: {
                vm.sheetLocation = vm.mapLocation
            },
            label: {
                Text("Learn more")
                    .font(.headline)
                    .frame(width: 125, height: 35)
               }
           )
           .buttonStyle(.borderedProminent)
       }
       
       private var renderNextButton: some View {
           Button (
            action: {
                vm.pressNextButton()
            }, label: {
                Text("Next")
                    .font(.headline)
                .frame(width: 125, height: 35)}
           )
           .buttonStyle(.bordered)
       }
}
