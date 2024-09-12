//
//  NetworkManager.swift
//  Initiative Tracker
//
//  Created by Dev Conch on 2024-08-31.
//


import Foundation
import SwiftUI


final class NetworkManager {
    
    static let shared = NetworkManager()
    let creatureURL = "https://developeroftheconch.github.io/Initiative-Tracker/FormattedCreatureData.json"
    
    private init () {}
    
    func getCreatures(completed: @escaping (Result<[CreatureData],ITError>) -> Void) {
        guard let url = URL(string:creatureURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)) { (data,response,error) in
            if nil != error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data=data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(CreatureResponse.self,from:data)
                completed(.success(decodedResponse.request))
            } catch {
                completed(.failure(.invalidData))
            }
            
            
            
        }
        
        task.resume()
        
    }
    
}
