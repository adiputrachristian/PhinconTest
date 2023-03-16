//
//  PokedexServiceProtocol.swift
//  NetworkKit
//
//  Created by Christian Adiputra on 05/03/23.
//

import Foundation
import Moya

public protocol PokedexServiceProtocol {
    
    func getAllPokemon(offSet: Int, onSuccess: ((BaseListPokedexModel<PokedexModel>)->Void)?, onFailure: ((Error)->Void)?)
    func getPokemonDetail(pokemonId: Int, onSuccess: ((PokemonDetail)->Void)?, onFailure: ((Error)->Void)?)
    
}
