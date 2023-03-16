//
//  BaseModel.swift
//  NetworkKit
//
//  Created by Christian Adiputra on 28/02/23.
//

import Foundation
public protocol NullableMap {
    init? (dict: [String: Any]?)
    func dictionary() -> [String: Any]?
}

public struct BaseListPokedexModel<T>: NullableMap where T: NullableMap {
    public var result: [T]?
    
    /// Use this init for **list** type of backend response
    /// - Parameters:
    ///   - dict: the dictionary
    public init?(dict: [String: Any]?) {
        guard let dict = dict else {return nil}
        
        result = nil
        if let data = dict["results"] as? [[String: Any]] {
            self.result = data.compactMap({T(dict: $0)})
        }
        
    }
    public func dictionary() -> [String: Any]? {
        var dict = [String: Any]()
        dict["results"] = result?.compactMap({$0.dictionary()})
        return dict
    }
}
