//
//  ViewController.swift
//  Pokedex1
//
//  Created by krikaz on 8/14/20.
//  Copyright © 2020 thewire. All rights reserved.
//

import UIKit

//final class ListDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
//    let names: [String]
//    let displayDetail: (String) -> Void
//
//    init(names: [String], displayDetail: @escaping (String) -> Void) {
//        self.names = names
//        self.displayDetail = displayDetail
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        displayDetail(names[indexPath.row])
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return names.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
//
//        cell.textLabel?.text = names[indexPath.row]
//        return cell
//    }
//
//}
//
//class ViewController: UIViewController {
//
//    let dataSource: ListDataSource
//    let tableView: UITableView
//
//    init(displayDetail: @escaping (String) -> Void) {
//        dataSource = ListDataSource(names: ["Siphan", "Sophol", "David"], displayDetail: displayDetail)
//        tableView = UITableView()
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//
//        title = "List"
//        view.addSubview(tableView)
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
//        tableView.dataSource = dataSource
//        tableView.delegate = dataSource
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
//        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//    }
//}

