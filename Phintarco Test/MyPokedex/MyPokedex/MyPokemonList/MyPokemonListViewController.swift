//
//  MyPokemonListViewController.swift
//  MyPokedex
//
//  Created by Christian Adiputra on 15/03/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import RealmSwift

final class MyPokemonListViewController: UIViewController {
    
    var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    // MARK: - Public properties -
    
    var presenter: MyPokemonListPresenterInterface!
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.getListMyPokemon()
    }
    
    private func setupView() {
        view.addSubview(tableView)
        
        tableView.register(MyPokemonCell.self, forCellReuseIdentifier: "MyPokemonCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        tableView.snp.makeConstraints { make in
            make.right.top.bottom.left.equalToSuperview()
        }
    }
    
}

// MARK: - Extensions -

extension MyPokemonListViewController: MyPokemonListViewInterface {
    func updateNameSucceess() {
        showAlert(title: "Success!", message: "Success update the pokemon name!")
    }
    
    func releaseSucceeded() {
        showAlert(title: "Success!", message: "Success release the pokemon!")
    }
    
    func releaseFailed() {
        showAlert(title: "Failed!", message: "You failed to release the Pokemon. Please try again")
    }
    
    func updateView() {
        tableView.reloadData()
    }
    
}

extension MyPokemonListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.myPokemon?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyPokemonCell", for: indexPath) as? MyPokemonCell else { return UITableViewCell() }
        guard let pokemon = presenter.myPokemon?[indexPath.row] else { return UITableViewCell()}

        cell.updateView(pokemon: pokemon)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { (rowAction, indexPath) in
            guard let id = self.presenter.myPokemon?[indexPath.row].id else { return }
            self.edit(id: id)
        }
        editAction.backgroundColor = .blue

        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (rowAction, indexPath) in
            guard let id = self.presenter.myPokemon?[indexPath.row].id else { return }
            self.presenter.releasePokemon(id: id)
        }
        deleteAction.backgroundColor = .red

        return [editAction,deleteAction]
    }
    
    
}

extension MyPokemonListViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil
        ))
        self.present(alert, animated: true, completion: nil)
    }
    
    func edit(id: ObjectId) {
        let alert = UIAlertController(title: "Edit", message: "Enter a new name", preferredStyle: .alert)

        alert.addTextField { (textField) in
            textField.text = self.presenter.getPokemonName(id: id)
        }

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            self.presenter.updatePokemonName(id: id, name: textField?.text ?? "-")
        }))

        self.present(alert, animated: true, completion: nil)
    }
}
