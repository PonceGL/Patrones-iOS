//
//  Details.swift
//  Pokedex
//
//  Created by Ponciano Guevara Lozano on 07/01/25.
//

import Foundation

struct PokemonDetails: Codable, Identifiable {
    let id: Int
    let name: String
    let sprites: Sprites
    let types: [Types]
}

struct Sprites: Codable {
    let frontDefault: String?
    let other: Other

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case other
    }
}

struct Other: Codable {
    let officialArtwork: DefaultAndShiny?
//    let showdown: Showdown?

    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
//        case showdown
    }
}

struct DefaultAndShiny: Codable {
    let frontDefault: String?
    let frontShiny: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}

//struct Showdown: Codable {
//    let frontDefault: String?
//    let backDefault: String?
//    let frontShiny: String?
//    let backShiny: String?
//
//    enum CodingKeys: String, CodingKey {
//        case frontDefault = "front_default"
//        case backDefault = "back_default"
//        case frontShiny = "front_shiny"
//        case backShiny = "back_shiny"
//    }
//}

struct Types: Codable {
    let slot: Int
    let type: Results
}
