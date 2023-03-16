//
//  DetailMockInteractor.swift
//  MyPokedexTests
//
//  Created by Christian Adiputra on 03/03/23.
//


import NetworkKit
@testable import MyPokedex

final class DetailMockInteractor: DetailCardInteractorInterface {
    
    var pokemonCard: PokeCardModel = PokeCardModel(id: "1", name: "pikachu", images: nil, subtype: ["Basic"], type: ["Fire"], supertype: "Pokemon", flavorText: "qwertyuiop", hp: "250")
    var getListCardCalled = 0
    
    func getListRecCard(page: Int, subtype: String, type: String) {
        getListCardCalled += 1
    }
    
    

    

}
