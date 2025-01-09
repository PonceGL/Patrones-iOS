//
//  GetPokemonDetailsUseCaseProtocol.swift
//  Pokedex
//
//  Created by Ponciano Guevara Lozano on 07/01/25.
//

import Foundation

protocol GetPokemonDetailsUseCaseProtocol {
    func execute(id: String) async throws -> PokemonDetails
}

final class GetPokemonDetailsUseCase: GetPokemonDetailsUseCaseProtocol {
    
    private let repository: PokemonRepository
    
    init(repository: PokemonRepository = PokemonRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute(id: String) async throws -> PokemonDetails {
        try await repository.fetchDetailsPokemon(id: id)
    }
    
}
