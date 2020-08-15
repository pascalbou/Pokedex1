//
//  MainViewController.swift
//  Pokedex1
//
//  Created by krikaz on 8/15/20.
//  Copyright © 2020 thewire. All rights reserved.
//

import UIKit

final class ListDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var pokemonNames: [String]
    let displayDetail: (String) -> Void
    
    init(pokemonNames: [String], displayDetail: @escaping (String) -> Void) {
        self.pokemonNames = pokemonNames
        self.displayDetail = displayDetail
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        displayDetail(pokemonNames[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath)
        cell.textLabel?.text = pokemonNames[indexPath.row].capitalized

//        let count = (self.pokemonNames.count)

        // fetches more pokemons when reaching the bottom of the list
//        if indexPath.row > 90, indexPath.row == count - 1 {
//            viewModel.fetchNextPokemons(count: count)
//        }

        return cell
    }
    
}

class MainViewController: UIViewController {
    
    let dataSource: ListDataSource
    let tableView: UITableView
    private let viewModel = MainViewModel(client: PokemonClient(pathBuilder: PokemonPathBuilder()))
    
    init(displayDetail: @escaping (String) -> Void) {
        dataSource = ListDataSource(pokemonNames: [], displayDetail: displayDetail)
        tableView = UITableView()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "List"
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PokemonCell")
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        bind()
        viewModel.viewDidLoad()
    }


    func bind() {
        viewModel.pokemonNames = { [weak self] pokemons in
            self?.dataSource.pokemonNames = pokemons
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        viewModel.title = { [weak self] title in
            self?.title = title
        }
    }

}
