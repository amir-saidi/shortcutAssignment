//
//  NetworkingService.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 3.11.22.
//

import Foundation

class NetworkingService {
    
    static let shared = NetworkingService()
    
    func makeRequest<T: Codable>(url: URL?, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = url else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let serverResponse = response as? HTTPURLResponse else {
                return completion(.failure(.badResponse))
            }
            
            guard error == nil else {
                return completion(.failure(.general(error!.localizedDescription)))
            }
            
            switch serverResponse.statusCode {
            case 200 ..< 300:
                guard let data = data else {
                    return completion(.failure(.noData))
                }
                
                guard let parsed: T = data.parse() else {
                    return completion(.failure(.parsing))
                }
                
                completion(.success(parsed))
            case 400 ..< 500:
                completion(.failure(.error400))
            default:
                completion(.failure(.serverError))
            }
        }.resume()
    }
}
