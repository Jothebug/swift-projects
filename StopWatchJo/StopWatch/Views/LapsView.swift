//
//  LapsView.swift
//  StopWatch
//
//  Created by HaYen on 22/9/24.
//

import SwiftUI

struct LapsView: View {
    
    @EnvironmentObject private var vm: LapsViewModel
    
    var body: some View {
        List {
            ForEach(vm.laps) { item in
                HStack(alignment: .center, spacing: 0) {
                    Text(item.title)
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        .foregroundColor(.white)
                    Spacer()
                    Text(item.value)
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        .foregroundColor(.white)
                }
                .listRowBackground(Color.clear) 
            }
        }
        .listStyle(PlainListStyle())
        .scrollIndicators(.hidden)
       
        
    }
}

#Preview {
    LapsView()
        .environmentObject(LapsViewModel())
        .preferredColorScheme(.dark)
}
