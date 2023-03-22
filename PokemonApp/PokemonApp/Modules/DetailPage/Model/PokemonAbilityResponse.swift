//
//  PokemonAbilityResponse.swift
//  PokemonApp
//
//  Created by Sena Kurtak on 23.03.2023.
//

// https://pokeapi.co/api/v2/pokemon/1/

class PokemonAbilityResponse: Codable {
    
    let abilities: [PokemonAbilityResult]

    enum CodingKeys: String, CodingKey {
        case abilities
    }
}
