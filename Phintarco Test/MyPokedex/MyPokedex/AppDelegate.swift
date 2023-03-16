//
//  AppDelegate.swift
//  MyPokedex
//
//  Created by Christian Adiputra on 28/02/23.
//

import UIKit
import Provider

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        PokedexProvider.instance = PokedexFeatureProvider()
        let nav = UINavigationController(rootViewController: PokedexProvider.instance.createPokedexScreenVC())
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        return true
    }
    
}

