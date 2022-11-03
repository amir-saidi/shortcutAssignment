//
//  HomeViewModel.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 3.11.22.
//

import Foundation

import Foundation

class HomeViewModel {
    
    // MARK: - Proeprties
    
    var loadedComic: Comic?
    var currentCommicNum: Int = -1
    
    var apiService: ComicsApiProtocol
    
    //  MARK: - Closures
    
    var onShowAlert: ((String, String) -> Void)?
    var newComicLoaded: ((Comic) -> Void)?
    
    // MARK: - Init
    
    init(apiService: ComicsApiProtocol = ComicsApi()) {
        self.apiService = apiService
    }
    
    // MARK: - Methods
    
    func getCurrentComic() {
        apiService.getCurrentComic { [unowned self] result in
            switch result {
            case .success(let comic):
                self.loadedComic = comic
                self.currentCommicNum = comic.num
                self.newComicLoaded?(comic)
            case .failure(let error):
                self.onShowAlert?("Error", error.localizedDescription)
            }
        }
    }
    
    func getPreviousComic() {
        guard let loadedNum = loadedComic?.num, loadedNum > 1 else { return }
        getComic(num: loadedNum - 1)
    }
    
    func getNextComic() {
        guard let loadedNum = loadedComic?.num, loadedNum < currentCommicNum else { return }
        getComic(num: loadedNum + 1)
    }
    
    
    func getComic(num: Int) {
        apiService.getComic(id: num) { [unowned self] result in
            switch result {
            case .success(let comic):
                self.loadedComic = comic
                self.newComicLoaded?(comic)
            case .failure(let error):
                self.onShowAlert?("Error", error.localizedDescription)
            }
        }
    }

}
