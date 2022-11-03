//
//  Endpoints.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 3.11.22.
//

import Foundation

enum Endpoints {
    case currentComic
    case comic(Int)
    case search(String)
    
    var endpoint: String {
        switch self {
        case .currentComic:
            return "/info.0.json"
        case .comic(let int):
            return "/\(int)/info.0.json"
        case .search(let query):
            return "/process?action=xkcd&query=\(query)"
        }
        
    }
    
    var url: URL? {
        switch self {
        case .search(_):
            return URL(string: "\(Constants.ApiConstants.searchUrl)\(self.endpoint)")
        default:
            return URL(string: "\(Constants.ApiConstants.baseURL)\(self.endpoint)")
        }
    }
}
