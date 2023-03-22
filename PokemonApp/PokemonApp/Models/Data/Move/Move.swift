//
//  Move.swift
//  PokemonApp
//
//  Created by Sena Kurtak on 22.03.2023.
//

import Foundation

class Move: Codable {
    let name : String
    let url : String
    let version_group_details : [VersionGroupDetails]
}
