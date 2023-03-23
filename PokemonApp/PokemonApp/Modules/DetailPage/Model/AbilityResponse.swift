//
//  Ability.swift
//  PokemonApp
//
//  Created by Sena Kurtak on 22.03.2023.
//

// https://pokeapi.co/api/v2/ability

class AbilityResponse: Codable {
    
    let results : [AbilityResult]
 
    enum CodingKeys: String, CodingKey {
        
        case results = "results"
        
    }
}
