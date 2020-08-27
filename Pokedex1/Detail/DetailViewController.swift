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
    
    let label: UILabel
    let types: UILabel
    //    @IBOutlet weak var pokemonImageView: UIImageView!
    //    @IBOutlet weak var pokemonNameLabel: UILabel!
    //    @IBOutlet weak var pokemonTypesLabel: UILabel!
    //    @IBOutlet weak var pokemonAttacksLabel: UILabel!

    init(pokemonName: String) {
        let label = UILabel()
        label.text = pokemonName
        self.label = label
        
        let types = UILabel()
        self.types = types
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        viewModel.pokemonName = label.text
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(types)
        types.translatesAutoresizingMaskIntoConstraints = false
        types.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 32).isActive = true
        types.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                
        bind()
        viewModel.viewDidLoad()
        
    }


    func bind() {
        viewModel.types = { [weak self] types in
            DispatchQueue.main.async {
                self?.types.text = types
            }
        }
        
//        viewModel.pokemonSprite = { [weak self] pokemonSprite in
//            DispatchQueue.main.async {
//                self?.pokemonImageView.image = UIImage(data: pokemonSprite)
//            }
//        }
        
//        viewModel.types = { [weak self] types in
//            DispatchQueue.main.async {
//                self?.pokemonTypesLabel.text = types
//            }
//        }
        
//        viewModel.attacks = { [weak self] attacks in
//            DispatchQueue.main.async {
//                self?.pokemonAttacksLabel.text = attacks
//            }
//        }
//        self.pokemonNameLabel.text = self.viewModel.pokemonName?.capitalized
    }

}
