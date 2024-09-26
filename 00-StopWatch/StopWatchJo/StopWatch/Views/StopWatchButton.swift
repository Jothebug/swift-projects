//
//  StopWatchButton.swift
//  StopWatch
//
//  Created by HaYen on 22/9/24.
//

import SwiftUI

struct StopWatchButton: View {
    
    let action: () -> Void
    let strokeColor: Color
    let backgroudColor: Color
    let label: String
    let labelColor: Color
    
    var body: some View {
        Button(action: action) {
            Circle()
                .frame(width: 85, height: 85)
                .foregroundColor(strokeColor)
                .overlay(
                    ZStack {
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundColor(backgroudColor)
                        
                        Text(label)
                            .font(.system(size: 20, weight: .regular, design: .rounded))
                            .foregroundColor(labelColor)
                    }
                )
        }
    }
}

#Preview {
    StopWatchButton(
        action: {},
        strokeColor: Color("GreenStroke"),
        backgroudColor: Color("GreenBg"),
        label: "Test",
        labelColor: Color("Green"))
}
