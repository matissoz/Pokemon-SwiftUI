//
//  Pokemon.swift
//  PokemonApp
//
//  Created by Matīss Zelmens on 10/10/2025.
//

import Foundation

struct PokemonResponse: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [PokemonListItem]
}

struct PokemonListItem: Decodable, Identifiable {
    let name: String
    let image: String?
    let url: String
    
    var id: String { url }
}

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let baseExperience: Int?
    let order: Int
    let isDefault: Bool
    let abilities: [PokemonAbility]
    let forms: [NamedResource]
    let gameIndices: [GameIndex]
    let heldItems: [HeldItem]
    let locationAreaEncounters: String
    let moves: [PokemonMove]
    let species: NamedResource
    let sprites: PokemonSprites
    let stats: [PokemonStat]
    let types: [PokemonType]
    let cries: PokemonCries?
    let pastAbilities: [PastAbility]?
    let pastTypes: [PastType]?
    
    enum CodingKeys: String, CodingKey {
        case id, name, height, weight, order, abilities, forms, moves, species, sprites, stats, types, cries
        case baseExperience = "base_experience"
        case isDefault = "is_default"
        case gameIndices = "game_indices"
        case heldItems = "held_items"
        case locationAreaEncounters = "location_area_encounters"
        case pastAbilities = "past_abilities"
        case pastTypes = "past_types"
    }
}

struct NamedResource: Decodable {
    let name: String
    let url: String
}

struct PokemonAbility: Decodable {
    let ability: NamedResource
    let isHidden: Bool
    let slot: Int
    
    enum CodingKeys: String, CodingKey {
        case ability, slot
        case isHidden = "is_hidden"
    }
}

struct GameIndex: Decodable {
    let gameIndex: Int
    let version: NamedResource
    
    enum CodingKeys: String, CodingKey {
        case version
        case gameIndex = "game_index"
    }
}

struct HeldItem: Decodable {
    let item: NamedResource
    let versionDetails: [VersionDetail]
    
    enum CodingKeys: String, CodingKey {
        case item
        case versionDetails = "version_details"
    }
}

struct VersionDetail: Decodable {
    let rarity: Int
    let version: NamedResource
}

struct PokemonMove: Decodable {
    let move: NamedResource
    let versionGroupDetails: [VersionGroupDetail]
    
    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
}

struct VersionGroupDetail: Decodable {
    let levelLearnedAt: Int
    let moveLearnMethod: NamedResource
    let versionGroup: NamedResource
    
    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }
}

struct PokemonSprites: Decodable {
    let backDefault: String?
    let backShiny: String?
    let frontDefault: String?
    let frontShiny: String?
    let backFemale: String?
    let backShinyFemale: String?
    let frontFemale: String?
    let frontShinyFemale: String?
    
    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case backFemale = "back_female"
        case backShinyFemale = "back_shiny_female"
        case frontFemale = "front_female"
        case frontShinyFemale = "front_shiny_female"
    }
}

struct PokemonStat: Decodable {
    let baseStat: Int
    let effort: Int
    let stat: NamedResource
    
    enum CodingKeys: String, CodingKey {
        case effort, stat
        case baseStat = "base_stat"
    }
}

struct PokemonType: Decodable {
    let slot: Int
    let type: NamedResource
}

struct PokemonCries: Decodable {
    let latest: String
    let legacy: String
}

struct PastAbility: Decodable {
    let abilities: [PokemonAbility]
    let generation: NamedResource
}

struct PastType: Decodable {
    let generation: NamedResource
    let types: [PokemonType]
}
