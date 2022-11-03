//
//  Home.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 3.11.22.
//

import UIKit
import UIKitHelper

class Home: UIViewController {
    
    // MARK: - Outlets
    
    var textLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = UIColor.systemBlue
        label.textAlignment = .center
        label.text = "Hello World!"
        return label
    }()
    
    // MARK: - Property
    
    var viewModel: HomeViewModel!
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
}


// MARK: - Setup

private extension Home {
    func setupView() {
        view.backgroundColor = UIColor.systemBackground
        setupNavigationView()
        setupInitial()
        initViewModel()
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
    
    func initViewModel() {
        viewModel = HomeViewModel()
        
        viewModel.newComicLoaded = { [unowned self] comic in
            DispatchQueue.main.async {
                self.textLabel.text = comic.title
            }
        }
        
        viewModel.onShowAlert = { [unowned self] title, msg in
            DispatchQueue.main.async {
                self.alert(title: title, message: msg, actions: "OK", handler: nil)
            }
        }
        
        viewModel.getCurrentComic()
    }
}
