//
//  DetailViewController.swift
//  Pokedex1
//
//  Created by krikaz on 8/14/20.
//  Copyright © 2020 thewire. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    let label: UILabel
    
    init(name: String) {
        let label = UILabel()
        label.text = name
        self.label = label
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
