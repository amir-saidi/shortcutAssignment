//
//  Alert.swift
//  ShortcutXkcdComics
//
//  Created by Amir Saidi on 3.11.22.
//

import UIKit

typealias AlertHandler = (Int) -> Void

extension UIViewController {
    
    func alert(title: String, message: String, actions: String..., handler: AlertHandler?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        for (index, action) in actions.enumerated() {
            alertController.addAction(UIAlertAction(title: action, style: .default, handler: { _ in
                handler?(index)
            }))
        }
        
        self.present(alertController, animated: true)
    }
}
