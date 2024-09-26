//
//  StopWatchApp.swift
//  StopWatch
//
//  Created by HaYen on 16/9/24.
//

import SwiftUI

@main
struct StopWatchApp: App {
    @StateObject private var vm = LapsViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
