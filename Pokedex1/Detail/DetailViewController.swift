//
//  DetailViewController.swift
//  Pokedex1
//
//  Created by krikaz on 8/15/20.
//  Copyright © 2020 thewire. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
    
    let viewModel = DetailViewModel(client: PokemonClient(pathBuilder: PokemonPathBuilder()))
    
    let pokemonNameLabel: UILabel
    let pokemonTypesLabel: UILabel
    let pokemonAttacksLabel: UILabel
    //    @IBOutlet weak var pokemonImageView: UIImageView!
    //    @IBOutlet weak var pokemonNameLabel: UILabel!
    //    @IBOutlet weak var pokemonTypesLabel: UILabel!
    //    @IBOutlet weak var pokemonAttacksLabel: UILabel!

    init(pokemonName: String) {
        let pokemonNameLabel = UILabel()
        pokemonNameLabel.text = pokemonName
        self.pokemonNameLabel = pokemonNameLabel
        
        let pokemonTypesLabel = UILabel()
        self.pokemonTypesLabel = pokemonTypesLabel
        
        let pokemonAttacksLabel = UILabel()
        self.pokemonAttacksLabel = pokemonAttacksLabel
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        viewModel.pokemonName = pokemonNameLabel.text
        
        view.addSubview(pokemonNameLabel)
        pokemonNameLabel.translatesAutoresizingMaskIntoConstraints = false
        pokemonNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        pokemonNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(pokemonTypesLabel)
        pokemonTypesLabel.translatesAutoresizingMaskIntoConstraints = false
        pokemonTypesLabel.centerYAnchor.constraint(equalTo: pokemonNameLabel.centerYAnchor, constant: 32).isActive = true
        pokemonTypesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(pokemonAttacksLabel)
        pokemonAttacksLabel.translatesAutoresizingMaskIntoConstraints = false
        pokemonAttacksLabel.centerYAnchor.constraint(equalTo: pokemonTypesLabel.centerYAnchor, constant: 32).isActive = true
        pokemonAttacksLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                
        bind()
        viewModel.viewDidLoad()
        
    }


    func bind() {
        viewModel.types = { [weak self] types in
            DispatchQueue.main.async {
                self?.pokemonTypesLabel.text = types
            }
        }
        
        viewModel.attacks = { [weak self] attacks in
            DispatchQueue.main.async {
                self?.pokemonAttacksLabel.text = attacks
            }
        }
        
        
//        viewModel.pokemonSprite = { [weak self] pokemonSprite in
//            DispatchQueue.main.async {
//                self?.pokemonImageView.image = UIImage(data: pokemonSprite)
//            }
//        }
        
//        self.pokemonNameLabel.text = self.viewModel.pokemonName?.capitalized
    }

}
