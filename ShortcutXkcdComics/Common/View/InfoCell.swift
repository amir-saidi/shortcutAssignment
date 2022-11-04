//
//  InfoCell.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 4.11.22.
//

import UIKit

class InfoCell: UITableViewCell {
    
    // MARK: - Outlets
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor.gray
        label.numberOfLines = 0
        return label
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    
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

private extension InfoCell {
    func setupView() {
        let vStack = VStack(subviews: [titleLabel, descriptionLabel], alignment: .fill, distribution: .fill, spacing: 8)
        addSubview(vStack)
        vStack.applyConstraints().fillSuperView(padding: 16)
    }
}
