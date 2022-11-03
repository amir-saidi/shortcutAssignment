//
//  NetworkingError.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 3.11.22.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case badResponse
    case noData
    case parsing
    case error400
    case serverError
    case general(String)
}
