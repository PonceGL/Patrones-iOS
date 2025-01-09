//
//  PokemonDetailViewModel.swift
//  Pokedex
//
//  Created by Ponciano Guevara Lozano on 08/01/25.
//

import Foundation

final class PokemonDetailViewModel: ObservableObject {
    @Published var details: PokemonDetails? = nil
    private let getPokemonDetailsUseCase: GetPokemonDetailsUseCaseProtocol
    
    init(getPokemonDetailsUseCase: GetPokemonDetailsUseCaseProtocol = GetPokemonDetailsUseCase()) {
        self.getPokemonDetailsUseCase = getPokemonDetailsUseCase
    }
    
    func loadPokemonDetails(id: String){
        Task{
            do {
                let response = try await getPokemonDetailsUseCase.execute(id: id)
                
                await MainActor.run {
                    self.details = response
                }
            } catch {
                print(error)
            }
        }
    }
}
