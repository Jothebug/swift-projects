//
//  LapsViewModel.swift
//  StopWatch
//
//  Created by HaYen on 22/9/24.
//

import Foundation

class LapsViewModel: ObservableObject {
    
    @Published var isRunning: Bool = false
    @Published var timeElasped: TimeInterval = 0
    
    @Published var laps: [LapModel] = []
    
    private var lapTimes = 0
    
    func startTimer() {
        isRunning = true
    }
    
    func stopTimer() { 
        isRunning = false
    }
    
    func lapTimer() {
        lapTimes += 1
        laps.append(LapModel(title: "Lap \(lapTimes)",value: "\(timeString(time: timeElasped))"))
        
        timeElasped = 0
    }
    
    func resetTimer() {
        isRunning = false
        timeElasped = 0
        lapTimes = 0
        laps = []
    }
    
    func timeString(time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        let miniseconds = Int((time.truncatingRemainder(dividingBy: 1)) * 100)
        
        return String(format: "%02d:%02d,%02d", minutes, seconds, miniseconds)
    }
    
}
