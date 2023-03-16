//
//  DetailPokedexWireframe.swift
//  MyPokedex
//
//  Created by Christian Adiputra on 06/03/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import DesignKit

final class DetailPokedexWireframe: BaseWireframe<DetailPokedexViewController> {

    // MARK: - Private properties -

    // MARK: - Module setup -

    init(pokemonId: Int) {
        let moduleViewController = DetailPokedexViewController()
        super.init(viewController: moduleViewController)

        let interactor = DetailPokedexInteractor()
        let presenter = DetailPokedexPresenter(view: moduleViewController, interactor: interactor, wireframe: self, pokemonId: pokemonId)
        interactor.presenter = presenter
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension DetailPokedexWireframe: DetailPokedexWireframeInterface {
}
