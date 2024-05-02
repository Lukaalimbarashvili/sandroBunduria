//
//  HeaderTableCell.swift
//  gexvewebiQeni
//
//  Created by Luka Alimbarashvili on 30.04.24.
//

import UIKit

class HeaderTableCell: UITableViewCell {
    
    static let identfier = "Cell"
    
    let myLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addSubviews()
        setupUI()
    }
    
    func addSubviews() {
        contentView.addSubview(myLabel)
    }
    
    func setupUI() {
        NSLayoutConstraint.activate([
            myLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
             myLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
             myLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
             myLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
    }
}
