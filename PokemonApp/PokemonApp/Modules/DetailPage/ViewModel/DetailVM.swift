//
//  DetailVM.swift
//  PokemonApp
//
//  Created by Sena Kurtak on 22.03.2023.
//

import Foundation
import SDWebImage
import Alamofire

class DetailVM {
    
    var pokemons: [PokemonResult] = []

    func getPokemonList(completion: @escaping (Result<PokemonResponse, Error>) -> Void) {
        AF.request("https://pokeapi.co/api/v2/pokemon/")
            .responseData { response in
                switch response.result {
                case .success(let data):
                    guard !data.isEmpty else {
                        let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Empty response data"])
                        print("Error retrieving Pokemon list: \(error)")
                        completion(.failure(error))
                        return
                    }
                    do {
                        let decoder = JSONDecoder()
                        let pokemonResponse = try decoder.decode(PokemonResponse.self, from: data)
                        self.pokemons = pokemonResponse.results
                        completion(.success(pokemonResponse))
                    } catch let error {
                        print("Error decoding response data: \(error)")
                        completion(.failure(error))
                    }
                    print(self.pokemons.first?.name)
                case .failure(let error):
                    print("Request failed with error: \(error)")
                    completion(.failure(error))
                }
            }
    }
}
