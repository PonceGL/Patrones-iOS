//
//  GetPokemonListUseCaseProtocol.swift
//  Pokedex
//
//  Created by Ponciano Guevara Lozano on 07/01/25.
//

import Foundation

protocol GetPokemonListUseCaseProtocol {
    func execute() async throws -> PokemonListResponse
}


final class GetPokemonListUseCase: GetPokemonListUseCaseProtocol {
    private let repository: PokemonRepository
    
    init(repository: PokemonRepository = PokemonRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute() async throws -> PokemonListResponse {
        try await repository.fetchListPokemons()
    }
}
