//
//  Comic.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 3.11.22.
//

import Foundation

class Comic: Codable {
    var month: String
    var num: Int
    var link: String
    var year: String
    var news: String
    var safeTitle: String
    var transcript: String
    var alt: String
    var img: String
    var title: String
    var day: String
    
    var dateStr: String {
        "\(month) \(day), \(year)"
    }
    
    var issueTile: String {
        "Comic #\(num) (\(dateStr))"
    }
    
    init(comicResponse: ComicResponse) {
        self.month = comicResponse.month
        self.num = comicResponse.num
        self.link = comicResponse.link
        self.year = comicResponse.year
        self.news = comicResponse.news
        self.safeTitle = comicResponse.safeTitle
        self.transcript = comicResponse.transcript
        self.alt = comicResponse.alt
        self.img = comicResponse.img
        self.title = comicResponse.title
        self.day = comicResponse.day
    }
    
}
