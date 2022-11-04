//
//  ImageExtension.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 4.11.22.
//

import Foundation
import Kingfisher
import UIKit


extension KFCrossPlatformImageView {
    func setComicImage(urlStr: String) {
        guard let url = URL(string: urlStr) else { return }
        let processor = DownsamplingImageProcessor(size: self.bounds.size)
                     |> RoundCornerImageProcessor(cornerRadius: 0)
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }

    }
}
