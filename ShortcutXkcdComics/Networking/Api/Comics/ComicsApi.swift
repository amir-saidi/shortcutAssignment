//
//  ComicApi.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 3.11.22.
//

import Foundation

class ComicsApi: ComicsApiProtocol {
    func getCurrentComic(completion: @escaping (Result<Comic, NetworkError>) -> Void) {
        NetworkingService.shared.makeRequest(url: Endpoints.currentComic.url) { (result: Result<ComicResponse, NetworkError> ) in
            switch result {
            case .success(let response):
                let comic = Comic(comicResponse: response)
                completion(.success(comic))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getComic(id: Int, completion: @escaping (Result<Comic, NetworkError>) -> Void) {
        NetworkingService.shared.makeRequest(url: Endpoints.comic(id).url) { (result: Result<ComicResponse, NetworkError> ) in
            switch result {
            case .success(let response):
                let comic = Comic(comicResponse: response)
                completion(.success(comic))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
