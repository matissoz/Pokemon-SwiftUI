//
//  ContentView.swift
//  PokemonApp
//
//  Created by Matīss Zelmens on 09/10/2025.
//

import SwiftUI

struct ContentView: View {
    @Environment(PokemonManager.self) var pokemonManager
    
    var body: some View {
        VStack {
            if pokemonManager.isLoading {
                ProgressView()
            } else {
                List(pokemonManager.pokemon) { pokemon in
                    HStack {
                        AsyncImage(url: URL(string: pokemon.image ?? "")) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                        } placeholder: {
                            ProgressView().frame(width: 60, height: 60)
                        }
                        Text(pokemon.name.capitalized)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView().environment(PokemonManager())
}
