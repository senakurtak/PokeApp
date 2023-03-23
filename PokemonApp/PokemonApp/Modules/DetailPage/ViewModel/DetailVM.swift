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
    var abilities : [AbilityResult] = []
    var pokemonAbilities : [PokemonAbilityResult] = []
    
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
    
    func getAbilitiesList(completion: @escaping (Result<AbilityResponse, Error>) -> Void){
        AF.request("https://pokeapi.co/api/v2/ability/")
            .responseData { response in
                switch response.result {
                case .success(let data):
                    guard !data.isEmpty else {
                        let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Empty response data"])
                        print("Error retrieving abilities list: \(error)")
                        completion(.failure(error))
                        return
                    }
                    do {
                        let decoder = JSONDecoder()
                        let abilitiesResponse = try decoder.decode(AbilityResponse.self, from: data)
                        self.abilities = abilitiesResponse.results
                        completion(.success(abilitiesResponse))
                    } catch let error {
                        print("Error decoding response data: \(error)")
                        completion(.failure(error))
                    }
                    print(self.abilities.first?.name)
                case .failure(let error):
                    print("Request failed with error: \(error)")
                    completion(.failure(error))
                }
            }
    }
    
    func getPokemonAbilities(id: Int, completion: @escaping (Result<PokemonAbilityResponse, Error>) -> Void) {
        AF.request("https://pokeapi.co/api/v2/pokemon/\(id)")
            .responseData { response in
                switch response.result {
                case .success(let data):
                    guard !data.isEmpty else {
                        let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Empty response data"])
                        print("Error retrieving abilities list: \(error)")
                        completion(.failure(error))
                        return
                    }
                    do {
                        let decoder = JSONDecoder()
                        let pokemonAbilitiesResponse = try decoder.decode(PokemonAbilityResponse.self, from: data)
                        self.pokemonAbilities = pokemonAbilitiesResponse.abilities
                        completion(.success(pokemonAbilitiesResponse))
                    } catch let error {
                        print("Error decoding response data: \(error)")
                        completion(.failure(error))
                    }
                case .failure(let error):
                    print("Request failed with error: \(error)")
                    completion(.failure(error))
                }
            }
    }
    
    func getPokemonImage(id: Int, completion: @escaping (Result<String, Error>) -> Void) {
        AF.request("https://pokeapi.co/api/v2/pokemon/\(id)")
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
                        let pokemonImageResponse = try decoder.decode(PokemonImageResponse.self, from: data)
                        let frontDefault = pokemonImageResponse.sprites.other.home.frontDefault
                        completion(.success(frontDefault))
                    } catch let error {
                        print("Error decoding response data: \(error)")
                        completion(.failure(error))
                    }
                case .failure(let error):
                    print("Request failed with error: \(error)")
                    completion(.failure(error))
                }
            }
    }

}
