//
//  TouristMapApp.swift
//  TouristMap
//
//  Created by HaYen on 3/10/24.
//

import SwiftUI

@main
struct TouristMapApp: App {
    @StateObject private var vm = LocationsViewModel()
    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .environmentObject(vm)
        }
    }
}
