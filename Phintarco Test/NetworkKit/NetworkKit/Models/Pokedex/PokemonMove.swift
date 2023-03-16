//
//  PokemonMove.swift
//  NetworkKit
//
//  Created by Christian Adiputra on 06/03/23.
//

import Foundation

public struct PokemonMove: NullableMap {
    
    public var move: BasicPokemonModel?
    
    public init?(dict: [String : Any]?) {
        if let move = dict?["move"] as? [String:Any] {
            self.move = BasicPokemonModel(dict: move)
        }
        
    }
    
    public func dictionary() -> [String : Any]? {
        var result: [String:Any] = [:]
        if let move = move { result["move"] = move }
        return result
    }
    
    
}
