//
//  Content.swift
//  RockPaperScissors
//
//  Created by HaYen on 29/8/24.
//

import SwiftUI

struct Content: View {
    let weapons: [String] = ["rock", "paper", "scissor" ]
    
    @State private var botWeapon: String = "paper"
    @State private var playerWeapon: String = "rock"
    @State private var playerScore: Int = 0

    
    var body: some View {
        ZStack {
            Color("theme").ignoresSafeArea()
            
            VStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.opacity(0))
                    .stroke(.white, lineWidth: 2)
                    .frame(width: .infinity, height: 150)
                    .overlay(
                        HStack{
                            VStack {
                                ForEach(weapons, id: \.self) { option in
                                    Text("\(option)".uppercased())
                                        .font(.title)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .fontDesign(.monospaced)
                                        .foregroundColor(.white)
                                }
                            }
                            Spacer()
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.white)
                                .stroke(.white, lineWidth: 2)
                                .frame(width: 130)
                                .overlay(
                                    VStack(alignment: .center) {
                                        Text("score".uppercased())
                                            .font(.title)
                                            .fontWeight(.semibold)
                                            .fontDesign(.monospaced)
                                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                        Text("\(playerScore)")
                                            .font(.system(size: 55, weight: .bold, design: .monospaced))
                                            .foregroundColor(Color("theme"))
                                    }
                                )
                        }
                            .padding()
                    )
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                
                Spacer()
                VStack(spacing: 80){
                    
                    HStack(spacing: 45){
                        SelectedWeapon
                            .overlay(
                                VStack(spacing: 8) {
                                    Text("Player")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .fontDesign(.monospaced)
                                    Image("\(playerWeapon)")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(
                                            width: playerWeapon == "scissor" ? 68 : 68,
                                            height: playerWeapon == "scissor" ? 68 : 68
                                        )
                                }
                            )
                        
                        SelectedWeapon
                            .overlay(
                                VStack(spacing: 8) {
                                    Text("Bot")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .fontDesign(.monospaced)
                                    Image("\(botWeapon)")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 68,height: 68)
                                }
                            )
                    }
                    
                    HStack(spacing: 15) {
                        Button(action: {
                            onSelectWeapon(weapon: "rock")
                        }, label: {
                            ThreeDButton
                            .overlay(
                                Image("rock")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                            )
                        })
                        
                        Button(action: {
                            onSelectWeapon(weapon: "paper")
                        }, label: {
                            ThreeDButton
                            .overlay(
                                Image("paper")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                            )
                        })
                        
                        Button(action: {
                            onSelectWeapon(weapon: "scissor")
                        }, label: {
                            ThreeDButton
                            .overlay(
                                Image("scissor")
                                     .resizable()
                                     .scaledToFit()
                                     .frame(width: 68, height: 68)
                            )
                        })
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                }
                Spacer()
            }
        }
    }
    
    var ThreeDButton: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(.gray)
                .frame(width: 110, height: 110)
                .offset(y: 5)
            
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("bgColorOptions"))
                .frame(width: 110, height: 106)
        }
    }
    
    var SelectedWeapon: some View {
        Circle()
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [Color("startColor"), Color("endColor")]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
            )
            .frame(width: 144, height: 145)
            .shadow(color: Color("endColor"), radius: 10, x: 0, y: 10)
    }
    
    func onSelectWeapon(weapon: String) {
        self.playerWeapon = weapon
        self.botWeapon = weapons[Int.random(in: 0..<3)]
        
        if(playerWeapon == "rock" && botWeapon == "paper") {
            playerScore -= 1
        } else if (playerWeapon == "rock" && botWeapon == "scissor"){
            playerScore += 1
        } else if(playerWeapon == "paper" && botWeapon == "scissor") {
            playerScore += 1
        }
    }
}

#Preview {
    Content()
}
