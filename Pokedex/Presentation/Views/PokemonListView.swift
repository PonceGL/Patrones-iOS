//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Ponciano Guevara Lozano on 07/01/25.
//

import SwiftUI

struct PokemonListView: View {
    @StateObject private var viewModel = PokemonListViewModel()
    
    var body: some View {
        List(viewModel.response?.results ?? [], id: \.name) { pokemon in
            Text(pokemon.name)
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
