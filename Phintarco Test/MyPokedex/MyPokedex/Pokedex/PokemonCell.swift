//
//  PokemonCell.swift
//  MyPokedex
//
//  Created by Christian Adiputra on 27/02/23.
//

import UIKit
import DesignKit
import NetworkKit

class PokemonCell: UICollectionViewCell {
    
    var container: UIView = {
        let kit = DesignKitImp()
        let view = kit.buildRoundedView(withRadius: 75)
        return view
    }()
    
    var imageView: UIImageView = {
        let image = UIImageView()
        image.image = ImageProvider.image(named: "bulbasaur")
        image.layer.cornerRadius = 60
        image.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(container)
        container.addSubview(imageView)
        addSubview(nameLabel)
        
        container.snp.makeConstraints { make in
            make.width.height.equalTo(150)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(120)
            make.centerX.centerY.equalTo(container)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(container.snp.bottom)
            make.centerX.equalTo(container)
        }
    }
    
    func updateView(pokemon: PokedexModel) {
        guard let id = pokemon.id else {return}
        let url = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png" ?? "")
        imageView.kf.setImage(with: url)
        nameLabel.text = pokemon.name ?? "abc"
    }
    
}
