//
//  DetailCardPresenterTest.swift
//  MyPokedexTests
//
//  Created by Christian Adiputra on 03/03/23.
//

import XCTest
import Quick
import Nimble
import NetworkKit
@testable import MyPokedex

final class DetailCardPresenterTest: QuickSpec {

    override func spec() {
        describe("DetailPresenterTests") {
            let view = DetailCardMockVC()
            let wireframe = DetailCardMockWireframe()
            let interactor = DetailMockInteractor()
            let presenter = DetailCardPresenter(view: view, interactor: interactor, wireframe: wireframe, pokemonCard: interactor.pokemonCard)
            
            
            describe("add page func test") {
                it("should increment page") {
                    presenter.addPage()
                    expect(presenter.page).to(equal(2))
                }
            }
            
            describe("get list rec card func test") {
                it("get list rec card func called") {
                    
                    expect(interactor.getListCardCalled).to(equal(1))
                }
            }
            
            describe("get name func test") {
                it("name variable should be equal") {
                    let result = presenter.getName()
                    
                    expect(result).to(equal("pikachu"))
                }
                
            }
            
            describe("get type hp func test") {
                it("hp+type should be equal") {
                    let result = presenter.getTypeHp()
                    
                    expect(result).to(equal("Fire (HP 250)"))
                }
            }
            
            describe("get super sub func test") {
                it("supertype+subtype should be equal") {
                    let result = presenter.getSuperSubType()
                    
                    expect(result).to(equal("Pokemon - Basic"))
                }
            }
            
            describe("get flavor text func test") {
                it("flavor text should be equal") {
                    let result = presenter.getFlavorText()
                    
                    expect(result).to(equal("\"qwertyuiop\""))
                }
            }
        }
    }
}
