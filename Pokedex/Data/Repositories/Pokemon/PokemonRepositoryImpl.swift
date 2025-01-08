//
//  ListRepositoryImpl.swift
//  Pokedex
//
//  Created by Ponciano Guevara Lozano on 07/01/25.
//

import Foundation

final class PokemonRepositoryImpl: PokemonRepository {
    private let apiClient: APIClient
    
    init(apiClient: APIClient = APIClient()) {
        self.apiClient = apiClient
    }

    func fetchListPokemons() async throws -> PokemonListResponse {
        let response: PokemonListResponse = try await apiClient.request(endpoint: .listPokemons)
        return response
    }
    
    func fetchDetailsPokemon(name: String) async throws -> PokemonDetails {
        let response: PokemonDetails = try await apiClient.request(endpoint: .detailsPokemon(name: name))
        return response
    }
}
