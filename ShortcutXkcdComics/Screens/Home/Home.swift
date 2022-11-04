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
    
    var comicView = ComicView()
    
    lazy var nextButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        btn.backgroundColor = UIColor.secondarySystemBackground
        btn.addTarget(self, action: #selector(nextAction(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var previousButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        btn.backgroundColor = UIColor.secondarySystemBackground
        btn.addTarget(self, action: #selector(previousAction(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var btnStack = HStack(subviews: [previousButton, nextButton], alignment: .fill, distribution: .fillEqually, spacing: 1)
    
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
        setupButtonStack()
        setupComicView()
        initViewModel()
    }
    
    func setupNavigationView() {
        title = "Comics"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchAction(_:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "info.circle"), style: .plain, target: self, action: #selector(showInfos(_:)))
    }
    
    func setupComicView() {
        view.addSubview(comicView)
        comicView
            .applyConstraints()
            .hFillSuperView(padding: Constants.defaultPadding)
            .top(to: view.safeAreaLayoutGuide.topAnchor)
            .bottom(to: btnStack.topAnchor, const: -8)
    }
    
    func setupButtonStack() {
        view.addSubview(btnStack)
        btnStack
            .applyConstraints()
            .bottom(to: view.safeAreaLayoutGuide.bottomAnchor, const: -Constants.defaultPadding)
            .hFillSuperView(padding: Constants.defaultPadding)
            .height(const: 44)
    }
    
    func initViewModel() {
        viewModel = HomeViewModel()
        
        viewModel.newComicLoaded = { [unowned self] comic in
            DispatchQueue.main.async {
                self.comicView.setComic(comic: comic)
                self.nextButton.isHidden = comic.num == self.viewModel.currentCommicNum
                self.previousButton.isHidden = comic.num == 1
                self.setButtonsEnabled(true)
            }
        }
        
        viewModel.onShowAlert = { [unowned self] title, msg in
            DispatchQueue.main.async {
                self.alert(title: title, message: msg, actions: "OK", handler: nil)
                self.setButtonsEnabled(true)
            }
        }
        
        viewModel.getCurrentComic()
    }
    
    func setButtonsEnabled(_ enabled: Bool) {
        previousButton.isEnabled = enabled
        nextButton.isEnabled = enabled
    }
}

// MARK: - Actions

private extension Home {
    @objc func nextAction(_ sender: UIButton) {
        setButtonsEnabled(false)
        viewModel.getNextComic()
    }
    
    @objc func previousAction(_ sender: UIButton) {
        setButtonsEnabled(false)
        viewModel.getPreviousComic()
    }
    
    @objc func searchAction(_ sender: UIBarButtonItem) {
        print("Show search")
    }
    
    @objc func showInfos(_ sender: UIBarButtonItem) {
        print("Show infos")
        guard let comic = viewModel.loadedComic else { return }
        
        let detailsView = ComicDetails()
        detailsView.comic = comic
        self.present(UINavigationController(rootViewController: detailsView), animated: true)
    }
}
