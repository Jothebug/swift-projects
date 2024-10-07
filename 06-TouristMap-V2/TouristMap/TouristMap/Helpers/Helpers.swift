//
//  Helpers.swift
//  TouristMap
//
//  Created by HaYen on 7/10/24.
//

import SwiftUI

struct NoPressEffectButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.blue)  // Set the text color or other style
            .scaleEffect(configuration.isPressed ? 1.0 : 1.0) // No scale effect when pressed
            .opacity(1) // No opacity change on press
    }
}
