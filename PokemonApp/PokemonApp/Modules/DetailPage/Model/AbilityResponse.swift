//
//  Ability.swift
//  PokemonApp
//
//  Created by Sena Kurtak on 22.03.2023.
//

// https://pokeapi.co/api/v2/ability

class AbilityResponse: Codable {
    
//    let count : Int?
//    let next : String?
//    let previous : String?
    let results : [AbilityResult]
 
    enum CodingKeys: String, CodingKey {
        
//        case count
//        case next
//        case previous
        case results = "results"
        
    }
}
