//
//  PokeDetailView.swift
//  Pokemon
//
//  Created by HaYen on 20/8/24.
//

import SwiftUI
import Kingfisher

struct PokeDetailView: View {
    @EnvironmentObject var vm: ViewModel
    
    let pokemon: Pokemon
    let dimension: Double = 180
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Color(vm.backgroundColor(forType: pokemon.type)).ignoresSafeArea()
                VStack {
                    HStack {
                        Spacer()
                        Text("\(pokemon.name.capitalized)")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .fontDesign(.monospaced)
                        Spacer()
                        Text(pokemon.type)
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 5)
                            .overlay(RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25)))
                            .frame(width: 90, height: 24)
                        Spacer()
                    }
                    KFImage(URL(string: pokemon.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: dimension, height: dimension)
                }
            }
            ZStack(alignment:.center) {
                Color(.white).ignoresSafeArea()
                VStack {
                    VStack(alignment: .leading) {
                        Text("Desciption")
                            .foregroundColor(.black)
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.bottom, 10)
                        Text(pokemon.description)
                            .foregroundColor(.secondary)
                            .font(.system(size: 14, weight: .regular, design: .monospaced))
                    }
                    .padding([.bottom], 15)
                    HStack {
                        Spacer()
                        VStack {
                            Text("Status").foregroundColor(.black).font(.title2).fontWeight(.bold)
                            Text("Weight: \(pokemon.weight)kg")
                                .foregroundColor(.secondary)
                                .font(.system(size: 14, weight: .regular, design: .monospaced))
                            Text("Height: \(pokemon.height)m")
                                .foregroundColor(.secondary)
                                .font(.system(size: 14, weight: .regular, design: .monospaced))
                        }
                        Spacer()
                        VStack {
                            Text("Skills").foregroundColor(.black).font(.title2).fontWeight(.bold)
                            Text("Attack: \(pokemon.attack)")
                                .foregroundColor(.secondary)
                                .font(.system(size: 14, weight: .regular, design: .monospaced))
                            Text("Defense: \(pokemon.defense)")
                                .foregroundColor(.secondary)
                                .font(.system(size: 14, weight: .regular, design: .monospaced))
                        }
                        Spacer()
                    }
                    Spacer()
                }
                
            }
        }
    }
}

#Preview {
    PokeDetailView(pokemon: Pokemon.samplePokemon).environmentObject(ViewModel())
}
