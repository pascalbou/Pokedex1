//
//  PokemonPathBuilderTests.swift
//  Pokedex1Tests
//
//  Created by krikaz on 9/2/20.
//  Copyright © 2020 thewire. All rights reserved.
//

@testable import Pokedex1
import XCTest

class PokemonPathBuilderTests: XCTestCase {
    func test_urlAllPokemons() {
        // Given
        let builder = PokemonPathBuilder()

        // When
        let url = builder.urlAllPokemons(limit: 100, offset: 0)
        
        // Then
        XCTAssertEqual(url, "https://pokeapi.co/api/v2/pokemon/?limit=100&offset=0")
    }
    
    func test_urlOnePokemon() {
        // Given
        let builder = PokemonPathBuilder()
        
        // When
        let url = builder.urlOnePokemon(for: "alakazam")
        
        // Then
        XCTAssertEqual(url, "https://pokeapi.co/api/v2/pokemon/alakazam")
    }
}
