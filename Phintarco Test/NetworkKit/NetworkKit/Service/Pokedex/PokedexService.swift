//
//  PokedexServiceProtocol.swift
//  NetworkKit
//
//  Created by Christian Adiputra on 05/03/23.
//

import Foundation
import Moya

public class PokedexService: PokedexServiceProtocol, APIMappingProtocol {
    
    private let provider: BaseProvider<PokedexProvider>
    public init(provider: BaseProvider<PokedexProvider> = BaseProvider<PokedexProvider>()) {
        self.provider = provider
    }
    
    public func getAllPokemon(offSet: Int,onSuccess: ((BaseListPokedexModel<PokedexModel>) -> Void)?, onFailure: ((Error) -> Void)?) {
        provider.request(.getPokemonList(offSet: offSet)) { [weak self] result in
            self?.handleResultLisPokemon(result, typeResponse: PokedexModel.self, onSuccess: onSuccess, onFailure: onFailure)
        }
    }
    
    
    public func getPokemonDetail(pokemonId: Int, onSuccess: ((PokemonDetail) -> Void)?, onFailure: ((Error) -> Void)?) {
        provider.request(.getPokemonDetail(pokemonId: pokemonId)) { [weak self] result in
            self?.handleResultDetailPokemon(result, typeResponse: PokemonDetail.self, onSuccess: onSuccess, onFailure: onFailure)
        }
    }
    
    
}

