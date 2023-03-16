//
//  DetailPokedexInteractor.swift
//  MyPokedex
//
//  Created by Christian Adiputra on 06/03/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import NetworkKit
import RealmSwift

final class DetailPokedexInteractor {
    weak var presenter: DetailPokedexInteractorOutputInterface?
    let pokedexService: PokedexServiceProtocol = PokedexService()
    let realm = try! Realm()
}

// MARK: - Extensions -

extension DetailPokedexInteractor: DetailPokedexInteractorInterface {
    func getTotalPokemon() -> Int {
        let list = realm.objects(MyPokemon.self).count
        return list
    }
    
    
    func addPokemon(pokemon: MyPokemon) {
        try! realm.write {
            realm.add(pokemon)
        }
    }
    
    
    func getDetailPokemon(id: Int) {
        pokedexService.getPokemonDetail(pokemonId: id) { [weak self] data in
            self?.presenter?.didSuccessGetDetailPokemon(pokemon: data)
        } onFailure: { [weak self] error in
            self?.presenter?.didFailedGetDetailPokemon(message: error.localizedDescription)
        }

    }
    
}