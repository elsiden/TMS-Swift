//
//  File.swift
//  tms17.1
//
//  Created by Ivan Klishevich on 07.08.2021.
//

import UIKit

extension UIViewController {
    @discardableResult
    func presentAlertController(with title: String?, message: String?, useTextField: Bool = false, preferredStyle: UIAlertController.Style = .alert, actions: UIAlertAction...) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        if useTextField, preferredStyle == .alert { alert.addTextField { _ in } }
        
        actions.forEach { alert.addAction($0) }
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
        return alert
    }
}
