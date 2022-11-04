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
        guard let date = getComicDate(yearStr: year, monthStr: month, dayStr: day) else {
            return "\(month) \(day), \(year)"
        }
        
        return date.toFormattedDate()
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

private extension Comic {
    func getComicDate(yearStr: String, monthStr: String, dayStr: String) -> Date? {
        guard let year = Int(yearStr), let month = Int(monthStr), let day = Int(dayStr) else { return nil }
        let calendar = Calendar(identifier: .gregorian)
        let components = DateComponents(year: year, month: month, day: day)
        return calendar.date(from: components)!
    }
}
