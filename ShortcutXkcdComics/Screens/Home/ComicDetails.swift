//
//  ComicDetails.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 4.11.22.
//

import UIKit
import UIKitHelper

class ComicDetails: UIViewController {
    
    // MARK: - Outlets
    
    let tableView: UITableView  = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(ComicCell.self, forCellReuseIdentifier: Constants.TableCellIdentifiers.comicCell)
        table.register(InfoCell.self, forCellReuseIdentifier: Constants.TableCellIdentifiers.infoCell)
        table.register(UITableViewCell.self, forCellReuseIdentifier: Constants.TableCellIdentifiers.cell)
        return table
    }()
    
    
    // MARK: - Properties
    
    var comic: Comic? {
        didSet {
            if comic != nil {
                self.tableView.reloadData()
            }
        }
    }
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupNavigationView()
    }
    
}

private extension ComicDetails {
    func setupView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.applyConstraints().fillSuperView()
    }
    
    func setupNavigationView() {
        title = "Detials"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(closeAction(_:)))
    }
    
    @objc func closeAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
}

extension ComicDetails: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let comic = comic else { return 0 }
        var temp = 2
        temp = comic.news == "" ? temp : temp + 1
        temp = comic.transcript == "" ? temp : temp + 1
        return temp
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1:
            return 4
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableCellIdentifiers.comicCell) as! ComicCell
            DispatchQueue.main.async {
                cell.comicImg.setComicImage(urlStr: self.comic!.img)
            }
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableCellIdentifiers.infoCell) as! InfoCell
            
            switch indexPath.row {
            case 0:
                cell.titleLabel.text = "Title"
                cell.descriptionLabel.text = comic!.title
            case 1:
                cell.titleLabel.text = "Num"
                cell.descriptionLabel.text = "\(comic!.num)"
            case 2:
                cell.titleLabel.text = "Year"
                cell.descriptionLabel.text = comic!.dateStr
            case 3:
                cell.titleLabel.text = "Alt"
                cell.descriptionLabel.text = comic!.alt
            default:
                break
            }
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableCellIdentifiers.infoCell) as! InfoCell
            if indexPath.section == 2 && comic!.news != "" {
                    cell.titleLabel.text = "News"
                    cell.descriptionLabel.text = comic!.news
                    return cell
            }
            
            cell.titleLabel.text = "Transcript"
            cell.descriptionLabel.text = comic!.transcript
            return cell
        }
    }
}
