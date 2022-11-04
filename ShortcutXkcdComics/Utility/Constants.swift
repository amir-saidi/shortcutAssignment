//
//  Constants.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 3.11.22.
//

import UIKit

enum Constants {
    
    static let defaultPadding: CGFloat = 16
    
    enum ApiConstants {
        static let baseURL = "https://xkcd.com"
        static let searchUrl = "https://relevantxkcd.appspot.com"
    }
    
    enum TableCellIdentifiers {
        static let cell = "TableCell"
        static let comicCell = "ComicCell"
        static let infoCell = "InfoCell"
    }
}
