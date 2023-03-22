//
//  API.swift
//  PokemonApp
//
//  Created by Sena Kurtak on 22.03.2023.
//

import Foundation
import Moya

var PokeApiProvider: MoyaProvider<PokeApi> {
    return MoyaProvider<PokeApi>(plugins:  [NetworkLoggerPlugin()])
}

var PokeApiProviderTest: MoyaProvider<PokeApi> {
    return MoyaProvider<PokeApi>(stubClosure: MoyaProvider.immediatelyStub)
}

enum PokeApi {
    case getPokemons(offset: Int, limit: Int)
    case getPokemonBy(name: String)
}

extension PokeApi: TargetType {
    var baseURL: URL {
        if let url = URL(string: "https://pokeapi.co/api/v2/") {
            return url
        }
        fatalError("poke api url issue")
    }
    
    var path: String {
        switch self {
        case .getPokemons:
            return "pokemon"
        case .getPokemonBy(let name):
            return "pokemon/\(name)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getPokemons, .getPokemonBy:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getPokemons(let offset, let limit):
            return .requestParameters(parameters: ["offset": offset, "limit": limit], encoding: URLEncoding.queryString)
        case .getPokemonBy:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
//    var sampleData: Data {
//        switch self {
//        case .getPokemons:
//            return FileReader.from(json: "PokemonList")
//        case .getPokemonBy:
//            return FileReader.from(json: "PokemonSpearow")
//        }
//    }
    
}
