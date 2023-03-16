//
//  MyPokemonListInteractor.swift
//  MyPokedex
//
//  Created by Christian Adiputra on 15/03/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import RealmSwift
import NetworkKit

final class MyPokemonListInteractor {
    weak var presenter: MyPokemonListInteractorOutputInterface?
    let realm = try! Realm()
    
}

// MARK: - Extensions -

extension MyPokemonListInteractor: MyPokemonListInteractorInterface {
    
    func updatePokemonName(id: ObjectId, name: String) {
        let selectedPokemon = realm.objects(MyPokemon.self).first(where: ({$0.id == id }))
        try! realm.write {
            selectedPokemon?.name = name
        }
        
    }
    
    func deletePokemon(id: ObjectId) {
        let selectedPokemon = realm.objects(MyPokemon.self).where({$0.id == id })
        try! realm.write {
            realm.delete(selectedPokemon)
        }
        
    }
    
    func getListMyPokemon() -> [MyPokemon] {
        
        var array: [MyPokemon] = []
        
        let object = realm.objects(MyPokemon.self)
        
        for i in 0 ..< object.count {
            if let result = object[i] as? MyPokemon {
                array.append(result)
            }
        }
        
        return array
    }
    
}
