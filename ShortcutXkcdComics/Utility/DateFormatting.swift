//
//  DateFormatting.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 4.11.22.
//

import Foundation


extension Date {
    func toFormattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, YYYY"
        return formatter.string(from: self)
    }
}
