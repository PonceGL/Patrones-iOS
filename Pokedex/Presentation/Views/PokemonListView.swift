//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Ponciano Guevara Lozano on 07/01/25.
//

import SwiftUI

struct PokemonListView: View {
    @StateObject private var viewModel = PokemonListViewModel()
    
//    private let pokemonSorted = viewModel.pokemonList.sorted {$0.id < $1.id}
    
    var body: some View {
        List(viewModel.pokemonList.sorted {$0.id < $1.id}, id: \.name) { pokemon in
            Text(pokemon.name)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .onAppear {
            Task {
                viewModel.loadPokemonList()
            }
        }
    }
}

#Preview {
    PokemonListView()
}
