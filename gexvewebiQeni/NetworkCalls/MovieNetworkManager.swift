//
//  MovieNetworkManager.swift
//  gexvewebiQeni
//
//  Created by Luka Alimbarashvili on 30.04.24.
//

import Foundation

class MovieNetworkManager {
    static func fetchMovies(completion: @escaping (MovieMyResponse?, Error?) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=c27503c748760190c16d3d881e5d366c&language=en-US&page=1") else {
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
                let characters = try JSONDecoder().decode(MovieMyResponse.self, from: data)
                completion(characters, nil)
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
    
    }
}
