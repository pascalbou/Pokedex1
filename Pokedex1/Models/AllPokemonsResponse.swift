//
//  AllPokemonsResponse.swift
//  Pokedex1
//
//  Created by krikaz on 8/15/20.
//  Copyright © 2020 thewire. All rights reserved.
//

import Foundation

struct AllPokemonsResponse: Decodable {
    var results: [Pokemon]
    var next: String?
    var previous: String?
}
