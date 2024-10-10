//
//  LocationDetail.swift
//  TouristMap
//
//  Created by HaYen on 8/10/24.
//

import SwiftUI
import MapKit

struct LocationDetail: View {
    @EnvironmentObject private var vm: LocationsViewModel
    @State var currentAmount: CGFloat = 0
    let location: Location
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            renderImages
            VStack(alignment: .leading, spacing: 16){
                renderName
                renderDescription
                renderMapLayer
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
    }
}

#Preview {
    LocationDetail(location: DataLocations.locations.first!)
        .environmentObject(LocationsViewModel())
}

extension LocationDetail {
    private var renderImages: some View {
        TabView {
            ForEach(location.imageNames, id: \.self) {
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
                    .scaleEffect(1 + currentAmount)
                    .gesture(
                        MagnifyGesture()
                            .onChanged { value in
                                currentAmount = value.magnification - 1
                            }
                            .onEnded { value in
                                withAnimation(.spring()) {
                                    currentAmount = 0
                                }
                            }
                    )
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var renderName: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("\(location.name)")
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(.primary)
            Text("\(location.cityName)")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
        }
    }
    
    private var renderDescription: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(location.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                
            if let url = URL(string: location.link) {
                Link("Read more on Wikipedia", destination: url)
                    .font(.headline)
                    .tint(.blue)
                }
            }
    }
    
    private var renderMapLayer: some View {
        Map(
            coordinateRegion: .constant(MKCoordinateRegion(center: location.coordinates,span: vm.mapSpan)),
            annotationItems: [location]) { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationAnnotation()
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
        }
            .allowsHitTesting(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
            .aspectRatio(1, contentMode: .fit)
            .cornerRadius(30)
    }
}
