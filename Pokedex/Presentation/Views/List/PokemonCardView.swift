//
//  PokemonCardView.swift
//  Pokedex
//
//  Created by Ponciano Guevara Lozano on 08/01/25.
//

import SwiftUI

struct PokemonCardView: View {
    let pokemon: PokemonDetails
    
    var body: some View {
        VStack(alignment: .leading) {
            if let imageUrl = pokemon.sprites.other.officialArtwork?.frontDefault {
                AsyncImage(url: URL(string: imageUrl)) { image in
                    image
                        .resizable()
                        .scaledToFit()
//                        .frame(width: 200)
                } placeholder: {
                    ProgressView()
                }
            }
            Text(pokemon.name.capitalized)
                .font(.headline)
            HStack {
                ForEach(pokemon.types, id: \.slot) { type in
                    Text(type.type.name.capitalized)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 2)
                        .background(Color.green.opacity(0.2)) // Cambia el color según el tipo
                        .cornerRadius(8)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}

#Preview {
    PokemonCardView(pokemon: PokemonDetails(
        id: 1,
        name: "bulbasaur",
        sprites: Sprites(
            frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
            other: Other(
                officialArtwork: DefaultAndShiny(
                    frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
                    frontShiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/1.png"
                )
            )
        ),
        types: [
            Types(slot: 1, type: Results(name: "grass", url: "https://pokeapi.co/api/v2/type/12/")),
            Types(slot: 2, type: Results(name: "poison", url: "https://pokeapi.co/api/v2/type/4/"))
        ]
    ))
}
