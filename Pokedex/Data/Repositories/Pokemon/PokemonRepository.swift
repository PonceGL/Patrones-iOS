//
//  ListRepository.swift
//  Pokedex
//
//  Created by Ponciano Guevara Lozano on 07/01/25.
//

import Foundation

protocol PokemonRepository {
    func fetchListPokemons() async throws -> PokemonListResponse
    func fetchDetailsPokemon(name: String) async throws -> PokemonDetails
}
