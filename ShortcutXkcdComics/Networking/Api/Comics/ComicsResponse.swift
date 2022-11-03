//
//  ComicsResponse.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 3.11.22.
//

import Foundation

struct ComicResponse: Codable {
    let month: String
    let num: Int
    let link: String
    let year: String
    let news: String
    let safeTitle: String
    let transcript: String
    let alt: String
    let img: String
    let title: String
    let day: String
}
