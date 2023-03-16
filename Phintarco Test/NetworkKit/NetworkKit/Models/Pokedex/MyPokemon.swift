//
//  MyPokemon.swift
//  NetworkKit
//
//  Created by Christian Adiputra on 15/03/23.
//

import Foundation
import RealmSwift

public class MyPokemon: Object {
    @Persisted(primaryKey: true) public var id: ObjectId
    @Persisted public var name: String = ""
    @Persisted public var imageURL: String = ""
    
    public convenience init(name: String, url: String) {
        self.init()
        self.name = name
        self.imageURL = url
    }
}
