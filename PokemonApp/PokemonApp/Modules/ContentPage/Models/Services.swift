//
//  Services.swift
//  PokemonApp
//
//  Created by Sena Kurtak on 22.03.2023.
//

import Foundation

enum APIError : Error , CustomStringConvertible {
    
    case badURL
    case badResponse(statusCode: Int)
    case url(URLError?)
    case parsing(DecodingError?)
    case unknown
     
    var localisedDescription : String {
        
        switch self {
        case .badURL , .parsing , .unknown :
            return "Something went wrong."
        case .badResponse(_):
            return "Connetion failed to server."
        case .url(let error):
            return error?.localizedDescription ?? "Sorry something went wrong"
        }
        
    }
    
    var description: String {
        
        switch self {
            
        case .badURL:
            return "invaild url / url problem "
        case .badResponse(statusCode: let statusCode):
            return " bad response -> code \(statusCode)"
        case .url(let error):
            return error?.localizedDescription ?? "Session errror."
        case .parsing(let error):
            return "parsing error \(error?.localizedDescription ?? " ")"
        case .unknown:
            return "unknoıwn error"
        }
    }
    
}

struct Results : Codable , Hashable {
   
    var name :String
    let sprites : String
    let types : [String]
    let abilities : [String]
    let stats : [[String]]
    let weight : Double
    let height : Double
    
    init(name: String, sprites: String, types: [String], abilities: [String], stats: [[String]], weight: Double, height: Double){
        self.name = name
        self.sprites = sprites
        self.types = types
        self.abilities = abilities
        self.stats = stats
        self.weight = weight
        self.height = height
    }
    
    static func example() -> Results{
        return Results(name: "Bulbasaur", sprites: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png", types: ["Grass","Poison"], abilities: ["Overgrow" , "Chlorophile"], stats: [["45","HP"] , ["49","Attack"] , ["65","Defence"]], weight: 69, height: 7)
    }
    
}
