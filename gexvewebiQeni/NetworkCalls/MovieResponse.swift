//
//  MovieResponse.swift
//  gexvewebiQeni
//
//  Created by Luka Alimbarashvili on 30.04.24.
//

struct MovieMyResponse: Decodable {
    let results: [MovieCharacter]
}

struct MovieCharacter: Decodable {
    let title: String
    let poster_path: String
}
