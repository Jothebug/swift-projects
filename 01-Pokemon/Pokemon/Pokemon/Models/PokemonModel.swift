//
//  PokemonModel.swift
//  Pokemon
//
//  Created by HaYen on 18/8/24.
//

import Foundation

struct Pokemon: Decodable, Identifiable, Equatable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
    let description: String
    
    let weight: Int
    let height: Int
    let attack: Int
    let defense: Int
    
    static var samplePokemon = Pokemon(id: 1,name: "bulbasaur", imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F2CF15848-AAF9-49C0-90E4-28DC78F60A78?alt=media&token=15ecd49b-89ff-46d6-be0f-1812c948e334", type: "poison", description: "Bulbasaur can be seen napping in bright sunlight.",  weight: 69, height: 69, attack: 7, defense: 49
    )
}
