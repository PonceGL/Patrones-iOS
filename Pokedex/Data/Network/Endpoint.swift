//
//  Endpoint.swift
//  Pokedex
//
//  Created by Ponciano Guevara Lozano on 07/01/25.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

enum Endpoint {
    case listPokemons
    case detailsPokemon(name: String)
    
    var url: URL {
        let baseURL = "https://pokeapi.co/api/v2"
        
        switch self {
        case .listPokemons:
            return URL(string: "\(baseURL)/pokemon")!
        case .detailsPokemon(let name):
            return URL(string: "\(baseURL)/pokemon/\(name)")!
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
}
