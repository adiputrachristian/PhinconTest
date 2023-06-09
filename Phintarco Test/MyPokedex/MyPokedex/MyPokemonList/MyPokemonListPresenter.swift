//
//  MyPokemonListPresenter.swift
//  MyPokedex
//
//  Created by Christian Adiputra on 15/03/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import NetworkKit
import RealmSwift

final class MyPokemonListPresenter {

    // MARK: - Private properties -

    private unowned let view: MyPokemonListViewInterface
    private let interactor: MyPokemonListInteractorInterface
    private let wireframe: MyPokemonListWireframeInterface
    var myPokemon: [MyPokemon]?

    // MARK: - Lifecycle -

    init(
        view: MyPokemonListViewInterface,
        interactor: MyPokemonListInteractorInterface,
        wireframe: MyPokemonListWireframeInterface
    ) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension MyPokemonListPresenter: MyPokemonListPresenterInterface {
    
    func releasePokemon(id: ObjectId) {
        
        let randomInt = Int.random(in: 2...9)
        if ((randomInt % 2) != 0) {
            view.releaseFailed()
        } else {
            interactor.deletePokemon(id: id)
            view.releaseSucceeded()
            getListMyPokemon()
        }
        
    }
    
    func getPokemonName(id: ObjectId) -> String {
        let name = myPokemon?.first(where: {$0.id == id})?.name ?? "-"
        return name
    }
    

    func getListMyPokemon() {
        myPokemon = interactor.getListMyPokemon()
        view.updateView()
    }
    
    func updatePokemonName(id: ObjectId, name: String) {
        interactor.updatePokemonName(id: id, name: name)
        view.updateView()
    }
    
}

extension MyPokemonListPresenter: MyPokemonListInteractorOutputInterface {
    func successGetListMyPokemon() {
        view.updateView()
    }
    
    
}
