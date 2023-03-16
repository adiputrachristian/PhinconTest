//
//  PokedexModel.swift
//  NetworkKit
//
//  Created by Christian Adiputra on 05/03/23.
//

import Foundation

public struct PokedexModel: NullableMap {
    
    public var id: String?
    public var name: String?
    public var url: String?
    
    public init(name: String?, url: String?) {
        self.name = name
        self.url = url
    }
    
    public init?(dict: [String : Any]?) {
        self.name = dict?["name"] as? String
        self.url = dict?["url"] as? String
        self.id = url?.replacingOccurrences(of: "https://pokeapi.co/api/v2/pokemon/", with: "").filter("0123456789.".contains)
    }
    
    public func dictionary() -> [String : Any]? {
        var result: [String: Any] = [:]
        if let name = name { result["name"] = name }
        if let url = url { result["url"] = url }
        return result
    }

}

