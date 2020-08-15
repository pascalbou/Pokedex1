//
//  MainViewModel.swift
//  Pokedex1
//
//  Created by krikaz on 8/15/20.
//  Copyright © 2020 thewire. All rights reserved.
//

import Foundation

final class MainViewModel {
    
    private let client: PokemonClientType
    private var pokemons: [Pokemon]? {
        didSet {
            self.pokemonNames?((self.pokemons?.map { $0.name })!)
        }
    }
    private var nextPokemonsURLString: String?

    // Outputs
    var pokemonNames: (([String]) -> Void)?
    var title: ((String) -> Void)?
    
    init(client: PokemonClientType) {
        self.client = client
    }
    
    func viewDidLoad() {
        // fetches the first 100 pokemons
        client.fetchAllPokemons(limit: 100, offset: 0) { (result) in
            switch result {
            case let .success(response):
                self.pokemons = response.results
                self.nextPokemonsURLString = response.next
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
        
        self.title?("Pokemons")
        
    }
    
    func fetchNextPokemons(count: Int) {
        guard let _ = self.nextPokemonsURLString else { return }
        client.fetchAllPokemons(limit: 100, offset: count) { (result) in
            switch result {
            case let .success(newPokemons):
                self.pokemons?.append(contentsOf: newPokemons.results)
                self.nextPokemonsURLString = newPokemons.next
            case let .failure(error):
                print(error.localizedDescription)
            }

        }

    }
}
