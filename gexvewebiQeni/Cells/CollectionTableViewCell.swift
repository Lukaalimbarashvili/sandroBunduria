//
//  CollectionTableViewCell.swift
//  gexvewebiQeni
//
//  Created by Luka Alimbarashvili on 29.04.24.
//

import UIKit
import Kingfisher

class CollectionTableViewCell: UITableViewCell {

    static let identfier = "tete"
        
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 170, height: 220)
        layout.sectionInset = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        var view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(TableCollectionViewCell.self, forCellWithReuseIdentifier: TableCollectionViewCell.identfier)
        return view
    }()
    
    var titleLabel: UILabel = {
       var label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var number: Int = 0
    
    var character: [RAMCharacter] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    var MovieCharacter: [MovieCharacter] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        fetchTheCharches()
        fetchTheMovies()
        setup()
        contentView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        contentView.addSubview(collectionView)
        contentView.addSubview(titleLabel)
        setupConstranits()
    }
    
    func setupConstranits() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: collectionView.topAnchor),
            
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

        ])
    }
    
    func fetchTheCharches() {
        RAMNetworkManager.fetchCharacters { response, error in
            DispatchQueue.main.async {
                if error != nil {
                    return
                }
                if let myResponse = response  {
                    let characters = myResponse.results
                    self.character = characters
                }
            }
        }
    }
    
    func fetchTheMovies() {
        MovieNetworkManager.fetchMovies { response, error in
            DispatchQueue.main.async {
                if error != nil {
                    return
                }
                if let myResponse = response  {
                    let characters = myResponse.results
                    self.MovieCharacter = characters
                }
            }
        }
    }
}

extension CollectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if number == 0 {
            return character.count
        } else {
            return MovieCharacter.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableCollectionViewCell.identfier, for: indexPath) as! TableCollectionViewCell
        if number == 0 {
            cell.myLabel.text = character[indexPath.row].name
            cell.myImageView.kf.setImage(with: URL(string: character[indexPath.row].image ))
        } else {
            cell.myLabel.text = MovieCharacter[indexPath.row].title
            cell.myImageView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(MovieCharacter[indexPath.row].poster_path)" ))
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.backgroundColor = .darkGray
    }
}
