//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Ponciano Guevara Lozano on 07/01/25.
//

import Foundation

final class PokemonListViewModel: ObservableObject {
    @Published var pokemonList: [PokemonDetails] = []
    private let getPokemonDetailsUseCase: GetPokemonDetailsUseCaseProtocol
    private let limit: Int = 20
    
    init(getPokemonDetailsUseCase: GetPokemonDetailsUseCaseProtocol = GetPokemonDetailsUseCase()) {
        self.getPokemonDetailsUseCase = getPokemonDetailsUseCase
    }
    
    func getPokemonDetails(id: String) async throws -> PokemonDetails {
        let response = try await getPokemonDetailsUseCase.execute(id: id)
        return response
    }
    
    func loadPokemonList(){
        Task {
            do {
                for index in 1...limit {
                    let response = try await getPokemonDetails(id: String(describing: index))
                    DispatchQueue.main.async {
                        self.pokemonList.append(response)
                    }
                }
                
                print("======================")
                print("loadPokemonList response")
                print("\(String(describing: self.pokemonList.first))")
                print("======================")
            } catch {
                print(error)
            }
        }
    }
}

