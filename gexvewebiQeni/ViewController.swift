//
//  ViewController.swift
//  gexvewebiQeni
//
//  Created by Luka Alimbarashvili on 29.04.24.
//

import UIKit

class ViewController: UIViewController {

    private let table: UITableView = {
        var table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        table.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identfier)
        table.separatorInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        return table
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        table.delegate = self
        table.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        250
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identfier, for: indexPath) as! CollectionTableViewCell
        cell.selectionStyle = .none
        if indexPath.row == 1 {
            cell.titleLabel.text = "Popular movies"
            cell.number = 1
        } else {
            cell.titleLabel.text = "Rick And Morty Characters"
        }
        
        return cell
    }
}
