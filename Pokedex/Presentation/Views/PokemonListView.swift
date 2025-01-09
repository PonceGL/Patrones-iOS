//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Ponciano Guevara Lozano on 07/01/25.
//

import SwiftUI

struct PokemonListView: View {
    @StateObject private var viewModel = PokemonListViewModel()
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(viewModel.pokemonList.sorted { $0.id < $1.id }) { pokemon in
                    PokemonCardView(pokemon: pokemon)
                }
            }
            .padding()
        }
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
