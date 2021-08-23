//
//  Checkers+Alert.swift
//  CheckersProject
//
//  Created by Ivan Klishevich on 15.08.2021.
//

import UIKit

extension Checkers {
    @discardableResult
    func presentAlertController(with title: String?, message: String?, prefferedStyle: UIAlertController.Style = .alert, actions: UIAlertAction...) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: prefferedStyle)
        actions.forEach { alert.addAction($0)}
        present(alert, animated: true, completion: nil)
        
        return alert
    }
}
