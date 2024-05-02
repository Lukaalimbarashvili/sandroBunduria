//
//  Response.swift
//  gexvewebiQeni
//
//  Created by Luka Alimbarashvili on 29.04.24.
//

struct RAMMyResponse: Decodable {
    let results: [RAMCharacter]
}

struct RAMCharacter: Decodable {
    let name: String
    let image: String
}
