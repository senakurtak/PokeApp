//
//  PokemonImageResponse.swift
//  PokemonApp
//
//  Created by Sena Kurtak on 23.03.2023.
//
// https://pokeapi.co/api/v2/pokemon/1

class PokemonImageResponse: Codable {
    
    let sprites : Sprites
    
    enum CodingKeys: String, CodingKey {
        
        case sprites
        
    }
}
