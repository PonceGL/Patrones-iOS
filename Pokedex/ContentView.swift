//
//  ContentView.swift
//  Pokedex
//
//  Created by Ponciano Guevara Lozano on 07/01/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    var body: some View {
        VStack {
            Text("Pokedex SwiftUI")
            PokemonListView()
        }
    }
}

#Preview {
    ContentView()
}
