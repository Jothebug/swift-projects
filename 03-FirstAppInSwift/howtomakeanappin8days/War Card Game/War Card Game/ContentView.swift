//
//  ContentView.swift
//  War Card Game
//
//  Created by HaYen on 16/8/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var theme = "background-plain"
    
    @State var playerCard = "back"
    @State var cpuCard = "back"
    
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {
        ZStack{
            Button(action: changeTheme, label: {Image(theme).resizable().ignoresSafeArea()})
            
            VStack {
                Spacer()
                Image("logo").aspectRatio(contentMode: .fit)
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                Button(action: deal, label: {Image("button")})
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player").font(.headline).foregroundColor(.white).padding(.bottom, 10)
                        Text(String(playerScore)).font(.title).foregroundColor(.white)
                    }
                    Spacer()
                    VStack{
                        Text("CPU").font(.headline).foregroundColor(.white).padding(.bottom, 10)
                        Text(String(cpuScore)).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.white)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
    
    func changeTheme(){
        let names = ["cloth", "plain", "wood-cartoon", "wood-grain"]
        let randomNames = names.randomElement()!
        theme = "background-" + randomNames
    }
    
    func deal(){
        let playerCardValue = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardValue)
        
        let cpuCardValue = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuCardValue)
        
        if (playerCardValue > cpuCardValue) {
            playerScore += 1
        } else if(cpuCardValue > playerCardValue) {
            cpuScore += 1
        }
    }
}

#Preview {
    ContentView()
}
