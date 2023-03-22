//
//  Ability.swift
//  PokemonApp
//
//  Created by Sena Kurtak on 22.03.2023.
//

// https://pokeapi.co/api/v2/ability

import Foundation

class AbilityResponse: Codable {
    
    let count : Int?
    let next : String?
    let previous : String?
    let result : [AbilityResult]
    
}
