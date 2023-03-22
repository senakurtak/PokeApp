////
////  PokemonNetworkManager.swift
////  PokemonApp
////
////  Created by Sena Kurtak on 22.03.2023.
////
//
//import Foundation
//import Moya
//
//protocol Networkable{
//    
//    var provider : MoyaProvider<API> {get}
//    func fetchPokemon(completion: @escaping (Result<Pokemon, Error>) -> ())
//    
//}
//
//class PokemonNetworkManager : Networkable {
//        
//    var provider = MoyaProvider<API>()
//    static let shared = PokemonNetworkManager()
//    
//    func fetchPokemon(completion: @escaping (Result<Pokemon, Error>) -> ()) {
//        request(target: .pokemon, completion: completion)
//    }
//}
//
//private extension PokemonNetworkManager {
//    private func request<T: Decodable>(target: API, completion: @escaping (Result<T, Error>) -> ()) {
//        provider.request(target) { result in
//            switch result {
//            case let .success(response):
//                do {
//                    let results = try JSONDecoder().decode(T.self, from: response.data)
//                    completion(.success(results))
//                } catch let error {
//                    completion(.failure(error))
//                }
//            case let .failure(error):
//                completion(.failure(error))
//            }
//        }
//    }
//}
