//
//  NetworkSingleton.swift
//  Github Followers
//
//  Created by Timothy Sonner on 11/23/22.
//

import Foundation

class NetworkSingleton {
    
    let baseUrl = "https://api.github.com"
    let resultsPerPage = 100
    
    // NetworkSingleton creates a globally scoped instance of itself.
    static let shared = NetworkSingleton()
    
    // private init can only be called from within this class.
    private init() {}
    
    func getFollowers(username: String, page: Int, completionHandler: @escaping (Result<[Followers], ErrorMessage>) -> Void) {
        let endpoint = baseUrl + "/users/\(username)/followers?per_page=\(resultsPerPage)&page=\(page)"
        guard let url = URL(string: endpoint) else {
            completionHandler(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
            if let _ = error {
                completionHandler(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completionHandler(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Followers].self, from: data)
                completionHandler(.success(followers))
            } catch {
                completionHandler(.failure(.invalidData))
            }
            
        })
        
        task.resume()
    }
}
