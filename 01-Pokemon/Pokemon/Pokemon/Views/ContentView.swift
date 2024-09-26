//
//  ContentView.swift
//  Pokemon
//
//  Created by HaYen on 18/8/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    
    private let adaptiveColumns = [GridItem(.flexible()),GridItem(.flexible())]
    
    var body: some View {
            NavigationView {
                    ScrollView {
                        LazyVGrid(columns: adaptiveColumns, spacing: 16) {
                            ForEach(vm.filteredPokemon) { pokemon in
                                NavigationLink(destination: PokeDetailView(pokemon: pokemon))
                                {
                                    PokemonCell(pokemon: pokemon)
                                }
                            }
                        }
                        .animation(.easeInOut(duration: 0.3), value: vm.filteredPokemon.count)
                        .navigationTitle("PokemonUI")
                        .navigationBarTitleDisplayMode(.inline)
                        .padding()
                    }
                    .searchable(text: $vm.searchText)
            }
            .environmentObject(vm)
    }
}

#Preview {
    ContentView()
}
