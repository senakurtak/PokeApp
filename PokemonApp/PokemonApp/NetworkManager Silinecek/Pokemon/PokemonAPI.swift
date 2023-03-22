//
//  PokemonAPI.swift
//  PokemonApp
//
//  Created by Sena Kurtak on 22.03.2023.
////
//
//import Foundation
//import Moya
//
//enum API {
//    case pokemon
//}
//
//extension API: TargetType {
//    var baseURL: URL {
//        guard let url = URL(string: "https://pokeapi.co/api/v2/") else {fatalError()}
//        return url
//    }
//    
//    var path: String {
//        switch self {
//        case .pokemon:
//            return "pokemon/"
//        }
//    }
//    
//    var method: Moya.Method {
//        return .get
//    }
//    
//    var task: Moya.Task {
//        switch self {
//        case .pokemon:
//            return .requestPlain
//        }
//    }
//    
//    var headers: [String : String]? {
//        return nil
//    }
//    
//}
