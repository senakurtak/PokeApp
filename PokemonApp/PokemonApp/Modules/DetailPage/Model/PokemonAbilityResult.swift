//
//  PokemonAbilityResult.swift
//  PokemonApp
//
//  Created by Sena Kurtak on 23.03.2023.
//


//class PokemonAbilityResult: Codable {
//
//    let name : String?
//    let url : String?
//
//
//}

class PokemonAbilityResult: Codable {
    
    let ability : PokemonAbilityOne
    
}

class PokemonAbilityOne: Codable{
    
    let name : String?
    let url : String?
    
}
