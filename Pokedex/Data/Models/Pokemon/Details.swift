//
//  Details.swift
//  Pokedex
//
//  Created by Ponciano Guevara Lozano on 07/01/25.
//

import Foundation

struct Details: Codable {
    let id: Int
    let name: String
    let sprites: Sprites
    let types: Types
}

struct Sprites: Codable {
    let other : Other?
}

struct Other : Codable {
    let officialArtwork : OfficialArtwork?

    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.officialArtwork = try values.decodeIfPresent(OfficialArtwork.self, forKey: .officialArtwork)
    }

}

struct OfficialArtwork : Codable {
    let frontDefault : String?
    let frontShiny : String?

    enum CodingKeys: String, CodingKey {
        
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.frontDefault = try values.decodeIfPresent(String.self, forKey: .frontDefault)
        self.frontShiny = try values.decodeIfPresent(String.self, forKey: .frontShiny)
    }

}

struct Types: Codable {
    let slot: Int
    let type: Results
}
