//
//  ContentView.swift
//  StopWatch
//
//  Created by HaYen on 16/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var vm: LapsViewModel
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color(.black).ignoresSafeArea()
            VStack(alignment: .center, spacing: 0) {
                Rectangle()
                    .frame(height: UIScreen.screenHeight / 2.2)
                    .foregroundColor(.clear)
                    .overlay(
                        VStack(spacing: 0) {
                            Spacer()
                            Text("\(vm.timeString(time: vm.timeElasped))")
                                .font(.system(size: 90, weight: .thin, design: .rounded))
                                .foregroundColor(.white)
                            
                            HStack(alignment: .center, spacing: 0) {
                                Spacer()
                                StopWatchButton(
                                    action: vm.isRunning ? vm.lapTimer : vm.resetTimer,
                                    strokeColor: Color("GrayStroke"),
                                    backgroudColor: Color.gray.opacity(0.2),
                                    label: vm.isRunning ? "Lap" : "Reset",
                                    labelColor: Color.white)
                                Spacer()
                                StopWatchButton(
                                    action: vm.isRunning ? vm.stopTimer : vm.startTimer,
                                    strokeColor: Color(vm.isRunning ? "RedStroke" : "GreenStroke"),
                                    backgroudColor: vm.isRunning ? Color.gray.opacity(0.2) : Color("GreenBg"),
                                    label: vm.isRunning ? "Stop" : "Start",
                                    labelColor: vm.isRunning ? Color("Red") : Color(red: 0.18, green: 0.82, blue: 0.35))
                                Spacer()
                            }
                            .padding(.top, 65)
                            .padding(.bottom, 15)
                            Divider().frame(height: 0.5).background(.secondary)
                        }
                    )
                LapsView()
            }
            .padding(.horizontal, 10)
            .onReceive(timer) { _ in
                if vm.isRunning {
                    vm.timeElasped += 0.1
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(LapsViewModel())
        .preferredColorScheme(.dark)
}
