//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Ponciano Guevara Lozano on 07/01/25.
//

import Foundation

final class PokemonListViewModel: ObservableObject {
    @Published var response: PokemonListResponse? = nil
    private let getPokemonsListUseCase: GetPokemonListUseCaseProtocol
    
    init(getPokemonsListUseCase: GetPokemonListUseCaseProtocol = GetPokemonListUseCase()) {
        self.getPokemonsListUseCase = getPokemonsListUseCase
    }
    
    func loadPokemonList(){
        Task {
            do {
                let response = try await getPokemonsListUseCase.execute()
                print("======================")
                print("loadPokemonList response")
                print("\(response)")
                print("======================")
                
                await MainActor.run {
                    self.response = response
                }
            } catch {
                print(error)
            }
        }
    }
}
