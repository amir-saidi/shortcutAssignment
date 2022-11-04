//
//  StackViewStore.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 4.11.22.
//

import UIKit

func HStack(subviews: [UIView]?, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill, spacing: CGFloat = 0) -> UIStackView {
    let stackView = subviews == nil ? UIStackView() : UIStackView(arrangedSubviews: subviews!)
    stackView.axis = .horizontal
    stackView.alignment = alignment
    stackView.distribution = distribution
    stackView.spacing = spacing
    return stackView
}

func VStack(subviews: [UIView]?, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill, spacing: CGFloat = 0) -> UIStackView {
    let stackView = subviews == nil ? UIStackView() : UIStackView(arrangedSubviews: subviews!)
    stackView.axis = .vertical
    stackView.alignment = alignment
    stackView.distribution = distribution
    stackView.spacing = spacing
    return stackView
}
