//
//  ComicCell.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 4.11.22.
//

import UIKit
import Kingfisher

class ComicCell: UITableViewCell {
    
    // MARK: - Outlets
    
    let comicImg = KFCrossPlatformImageView()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup
    
}

private extension ComicCell {
    func setupView() {
        addSubview(comicImg)
        comicImg.applyConstraints().fillSuperView(padding: 16).height(const: 300)
    }
}
