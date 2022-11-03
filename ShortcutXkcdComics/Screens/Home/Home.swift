//
//  Home.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 3.11.22.
//

import UIKit
import UIKitHelper

class Home: UIViewController {
    
    var textLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = UIColor.systemBlue
        label.textAlignment = .center
        label.text = "Hello World!"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
}

private extension Home {
    func setupView() {
        view.backgroundColor = UIColor.systemBackground
        setupNavigationView()
        setupInitial()
    }
    
    func setupInitial() {
        view.addSubview(textLabel)
        textLabel
            .applyConstraints()
            .centerToContainer()
    }
    
    func setupNavigationView() {
        title = "Comics"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        
    }
}
