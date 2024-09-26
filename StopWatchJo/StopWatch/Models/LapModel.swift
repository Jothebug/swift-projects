//
//  LapModel.swift
//  StopWatch
//
//  Created by HaYen on 22/9/24.
//

import Foundation

struct LapModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let value: String
    
    static var sampleData = LapModel(title: "Lap 1", value: "00:00,01")
}
