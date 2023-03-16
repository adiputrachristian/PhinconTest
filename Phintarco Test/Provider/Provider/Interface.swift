//
//  Interface.swift
//  Provider
//
//  Created by Christian Adiputra on 28/02/23.
//

import Foundation
import UIKit

public class PokedexProvider {
    public static var instance: PokedexInterface!
}

public protocol PokedexInterface {
    
    /// Create a home screen page
    func createPokedexScreenVC() -> UIViewController

}
