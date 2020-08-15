//
//  NetworkError.swift
//  Pokedex1
//
//  Created by krikaz on 8/15/20.
//  Copyright © 2020 thewire. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case badImage
    case badData
    case noDecode
    case otherError
}
