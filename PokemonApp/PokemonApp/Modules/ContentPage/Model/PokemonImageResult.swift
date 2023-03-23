//
//  PokemonImageResult.swift
//  PokemonApp
//
//  Created by Sena Kurtak on 23.03.2023.
//


class Sprites: Codable{
    
    let other : Other
    
}

class Other: Codable{
    
    let home : Home
    
}

struct Home: Codable {
    let frontDefault: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
