//
//  TableCollectionViewCell.swift
//  gexvewebiQeni
//
//  Created by Luka Alimbarashvili on 29.04.24.
//

import UIKit

class TableCollectionViewCell: UICollectionViewCell {
    
    static let identfier = "Cell"
    
    let myLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = label.font.withSize(14)
        return label
    }()
    
    let myImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
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
        contentView.addSubview(myImageView)
    }
    
    func setupUI() {
        NSLayoutConstraint.activate(
            [myImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
             myImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
             myImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -34),
             
             myLabel.topAnchor.constraint(equalTo: myImageView.bottomAnchor),
             myLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
             myLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
             myLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            ])
    }
}
