//
//  PokedexDetail.swift
//  NetworkKit
//
//  Created by Christian Adiputra on 06/03/23.
//

import Foundation

public struct PokemonDetail: NullableMap {
    
    public var id: Int?
    public var name: String?
    public var types: [PokemonType?]?
    public var images: PokemonSprites?
    public var moves: [PokemonMove?]?
    
    public init?(dict: [String : Any]?) {
        self.id = dict?["id"] as? Int ?? 0
        self.name = dict?["name"] as? String
        
        if let types = dict?["types"] as? [[String:Any]] {
            self.types = types.map({PokemonType(dict: $0)})
        }
        
        if let moves = dict?["moves"] as? [[String:Any]] {
            self.moves = moves.map({PokemonMove(dict: $0)})
        }
        
        if let sprites = dict?["sprites"] as? [String:Any] {
            self.images = PokemonSprites(dict: sprites)
        }
        
    }
    
    public func dictionary() -> [String : Any]? {
        var result: [String: Any] = [:]
        if let id = id { result["id"] = id }
        if let name = name { result["name"] = name }
        if let images = images { result["sprites"] = images }
        if let types = types { result["types"] = types }
        if let moves = moves { result["moves"] = moves }
        return result
    }
    
    
}
