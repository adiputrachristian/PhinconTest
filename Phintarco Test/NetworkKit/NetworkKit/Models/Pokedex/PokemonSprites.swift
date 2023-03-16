//
//  PokemonSprites.swift
//  NetworkKit
//
//  Created by Christian Adiputra on 06/03/23.
//

import Foundation

public struct PokemonSprites: NullableMap {
    
    public var frontDefault: String?
    
    public init?(dict: [String : Any]?) {
        self.frontDefault = dict?["front_default"] as? String
    }
    
    public func dictionary() -> [String : Any]? {
        var result: [String: Any] = [:]
        if let frontDefault = frontDefault { result["front_default"] = frontDefault }
        return result
    }
    
}

