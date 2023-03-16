//
//  PokemonType.swift
//  NetworkKit
//
//  Created by Christian Adiputra on 06/03/23.
//

import Foundation
import UIKit

public enum PokemonTypes {
    case normal, fighting, flying, poison, ground, rock, bug, ghost, steel, fire, water, grass, electric, psychic, ice, dragon, dark, fairy, unknown, shadow
    
    func getColor(type: String) -> UIColor {
        switch self {
        case .normal, .unknown:
            return UIColor.gray
        case .fighting, .fire:
            return  UIColor.red
        case .flying, .fairy, .psychic, .steel, .dragon:
            return UIColor.lightGray
        case .poison:
            return UIColor.purple
        case .ground, .rock:
            return UIColor.brown
        case .bug, .grass:
            return UIColor.green
        case .water, .ice:
            return UIColor.blue
        case .ghost, .dark, .shadow:
            return UIColor.black
        case .electric:
            return UIColor.yellow
        }
    }
    
}

public struct BasicPokemonModel: NullableMap {
    
    public var name: String?
    public var typeUrl: String?
    
    public init?(dict: [String : Any]?) {
        self.name = dict?["name"] as? String
        self.typeUrl = dict?["url"] as? String
    }
    
    public func dictionary() -> [String : Any]? {
        var result: [String: Any] = [:]
        if let name = name { result["name"] = name }
        if let typeUrl = typeUrl { result["url"] = typeUrl }
        return result
    }
    
}
