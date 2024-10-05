//
//  LocationAnnotation.swift
//  TouristMap
//
//  Created by HaYen on 5/10/24.
//

import SwiftUI

struct LocationAnnotation: View {
    let iconColor = Color("AccentColor")
    let circleSize: CGFloat = 40
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Image(systemName: "circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: circleSize, height: circleSize)
                    .foregroundColor(iconColor)
                
                Image(systemName: "mappin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: circleSize / 2, height: circleSize / 2)
                    .foregroundColor(.white)
            }
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(iconColor)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
        }
    }
}

#Preview {
    LocationAnnotation()
}
