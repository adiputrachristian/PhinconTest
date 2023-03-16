//
//  MyPokemonCell.swift
//  MyPokedex
//
//  Created by Christian Adiputra on 15/03/23.
//

import UIKit
import DesignKit
import NetworkKit


class MyPokemonCell: UITableViewCell {
    
    var imgPokemon: UIImageView = {
        let image = UIImageView()
        image.image = ImageProvider.image(named: "bulbasaur")
        image.contentMode = .scaleAspectFit
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .midnightBlue
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = "bulbasur"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(imgPokemon)
        addSubview(nameLabel)
        
        imgPokemon.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.height.width.equalTo(50)
            make.centerY.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(imgPokemon.snp.right).offset(8)
            make.centerY.equalToSuperview()
        }
    }
    
    func updateView(pokemon: MyPokemon) {
        
        nameLabel.text = pokemon.name
        imgPokemon.kf.setImage(with: URL(string: pokemon.imageURL))
    }
}
