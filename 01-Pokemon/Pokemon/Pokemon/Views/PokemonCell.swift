//
//  PokemonView.swift
//  Pokemon
//
//  Created by HaYen on 18/8/24.
//

import SwiftUI
import Kingfisher

struct PokemonCell: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon

    var body: some View {
        ZStack {
            VStack(alignment:.leading) {
                Text("\(pokemon.name.capitalized)")
                    .font(.system(size: 18, weight: .bold, design: .monospaced))
                    .foregroundColor(.white)
                    .padding(.top, 8)
                    .padding(.leading)
                
                HStack {
                    Text(pokemon.type)
                        .font(.system(size: 14, weight: .semibold, design: .monospaced))
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay(RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white.opacity(0.25)))
                        .frame(width: 90, height: 24)
                    
                    KFImage(URL(string: pokemon.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68, height: 68)
                        .padding([.bottom, .trailing], 4)
                }
            }
        }
        .background(Color(vm.backgroundColor(forType: pokemon.type)))
        .cornerRadius(12)
        .shadow(color: Color(vm.backgroundColor(forType: pokemon.type)), radius: 6, x:0, y:0)
    }
}

#Preview {
    PokemonCell(pokemon: Pokemon.samplePokemon).environmentObject(ViewModel())
}
