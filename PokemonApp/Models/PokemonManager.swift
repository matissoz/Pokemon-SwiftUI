//
//  PokemonManager.swift
//  PokemonApp
//
//  Created by Matīss Zelmens on 10/10/2025.
//

import Alamofire
import Foundation
import Observation

@Observable class PokemonManager {
  var pokemon: [PokemonListItem] = []
  var isLoading = false
  var errorMessage: String?

  init() {
    fetchPokemon()
  }

  func fetchPokemon(offset: Int = 0, limit: Int = 20) {
    isLoading = true
    errorMessage = nil

    AF.request("https://pokeapi.co/api/v2/pokemon?offset=\(offset)&limit=\(limit)")
      .responseDecodable(of: PokemonResponse.self) { response in
        self.isLoading = false

        switch response.result {
        case .success(let data):
          self.pokemon = data.results.map { item in
            let pokemonId = item.url.split(separator: "/").last.flatMap { Int($0) } ?? 0
              print("pokemon \(pokemonId)")
            let imageUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemonId).png"
            return PokemonListItem(name: item.name, image: imageUrl, url: item.url)
          }
        case .failure(let error):
          self.errorMessage = error.localizedDescription
        }
      }
  }
}
