//
//  Coordinator.swift
//  Pokedex1
//
//  Created by krikaz on 8/14/20.
//  Copyright © 2020 thewire. All rights reserved.
//

import UIKit

final class AppCoordinator {
    // MARK: - Properties

    private let window: UIWindow
    private var navigationController: UINavigationController!

    // MARK: - Initializers

    init(window: UIWindow) {
        self.window = window
    }

    // MARK: - CoordinatorType

    func start() {
        let mainViewController = MainViewController(displayDetail: displayDetail)

        navigationController = UINavigationController(rootViewController: mainViewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func displayDetail(pokemonName: String) {
        let viewController = DetailViewController(pokemonName: pokemonName)
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
