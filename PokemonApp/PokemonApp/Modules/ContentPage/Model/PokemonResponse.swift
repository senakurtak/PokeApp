//
//  Pokemon.swift
//  PokemonApp
//
//  Created by Sena Kurtak on 22.03.2023.
//

//https://pokeapi.co/api/v2/pokemon/

class PokemonResponse: Codable {
    
    let results: [PokemonResult]
    
    enum CodingKeys: String, CodingKey {
        
        case results = "results"
        
    }
}

