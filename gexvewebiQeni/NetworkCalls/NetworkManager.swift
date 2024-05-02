//
//  NetworkManager.swift
//  gexvewebiQeni
//
//  Created by Luka Alimbarashvili on 29.04.24.
//

import Foundation

class RAMNetworkManager {
    static func fetchCharacters(completion: @escaping (RAMMyResponse?, Error?) -> Void) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/") else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let data = data else {
                completion(nil, NSError(domain: "No data received", code: 0, userInfo: nil))
                return
            }

            do {
                let characters = try JSONDecoder().decode(RAMMyResponse.self, from: data)
                completion(characters, nil)
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
    }
}
