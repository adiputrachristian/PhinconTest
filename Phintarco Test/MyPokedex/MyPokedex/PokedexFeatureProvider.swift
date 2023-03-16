//
//  MainFeatureProvider.swift
//  MyPokedex
//
//  Created by Christian Adiputra on 28/02/23.
//

import Foundation
import UIKit
import Provider
import NetworkKit

public class PokedexFeatureProvider: PokedexInterface {
    
    public init() {}
    
    public func createPokedexScreenVC() -> UIViewController {
        return PokedexWireframe().viewController
    }

}
