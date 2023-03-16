//
//  PokemonType.swift
//  NetworkKit
//
//  Created by Christian Adiputra on 06/03/23.
//

import Foundation

public struct PokemonType: NullableMap {
    
    public var type: BasicPokemonModel?
    
    public init?(dict: [String : Any]?) {
        if let move = dict?["type"] as? [String:Any] {
            self.type = BasicPokemonModel(dict: move)
        }
        
    }
    
    public func dictionary() -> [String : Any]? {
        var result: [String:Any] = [:]
        if let type = type { result["type"] = type }
        return result
    }
    
    
}
