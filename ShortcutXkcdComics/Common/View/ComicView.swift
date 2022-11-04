//
//  ComicView.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 4.11.22.
//

import UIKit
import UIKitHelper
import Kingfisher

class ComicView: UIView {
    
    // MARK: - Outlets
    
    var comicIsueNum: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = UIColor.systemBlue
        label.textAlignment = .center
        return label
    }()
    
    var comicTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        label.textColor = UIColor.darkGray
        label.textAlignment = .center
        return label
    }()
    
    var comicImageView = KFCrossPlatformImageView()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func setComic(comic: Comic) {
        comicIsueNum.text = comic.issueTile
        comicTitle.text = comic.title
        comicImageView.setComicImage(urlStr: comic.img)
//        setComicImage(urlStr: comic.img)
    }
}

private extension ComicView {
    func setupView() {
        addSubview(comicIsueNum)
        comicIsueNum
            .applyConstraints()
            .hFillSuperView()
            .top(to: self)
        
        addSubview(comicTitle)
        comicTitle
            .applyConstraints()
            .hFillSuperView()
            .top(to: comicIsueNum.bottomAnchor, const: 8)
        
        addSubview(comicImageView)
        comicImageView
            .applyConstraints()
            .hFillSuperView()
            .top(to: comicTitle.bottomAnchor, const: 8)
            .bottom(to: self)
    }
    
//    func setComicImage(urlStr: String) {
//        guard let url = URL(string: urlStr) else { return }
//        let processor = DownsamplingImageProcessor(size: comicImageView.bounds.size)
//                     |> RoundCornerImageProcessor(cornerRadius: 0)
//        comicImageView.kf.indicatorType = .activity
//        comicImageView.kf.setImage(
//            with: url,
//            placeholder: UIImage(named: "placeholderImage"),
//            options: [
//                .processor(processor),
//                .scaleFactor(UIScreen.main.scale),
//                .transition(.fade(1)),
//                .cacheOriginalImage
//            ])
//        {
//            result in
//            switch result {
//            case .success(let value):
//                print("Task done for: \(value.source.url?.absoluteString ?? "")")
//            case .failure(let error):
//                print("Job failed: \(error.localizedDescription)")
//            }
//        }
//
//    }
}
