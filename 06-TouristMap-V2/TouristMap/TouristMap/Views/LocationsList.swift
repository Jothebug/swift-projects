//
//  LocationsList.swift
//  TouristMap
//
//  Created by HaYen on 7/10/24.
//

import SwiftUI

struct LocationsList: View {
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) { location in
                Button(action: {
                    vm.showNextLocation(location: location)
                }, label: {
                    cardView(location: location)
                        .padding(.vertical, 2)
                        .listRowBackground(Color.clear)
                })
            }
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    LocationsList().environmentObject(LocationsViewModel())
}

extension LocationsList {
    private func cardView(location: Location) -> some View {
        HStack() {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        }
    }
}
