//
//  ComicsApiProtocol.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 3.11.22.
//

import Foundation

protocol ComicsApiProtocol {
    func getCurrentComic(completion: @escaping (Result<Comic, NetworkError>) -> Void)
    func getComic(id: Int, completion: @escaping (Result<Comic, NetworkError>) -> Void)
}
