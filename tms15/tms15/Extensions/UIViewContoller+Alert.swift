//
//  UIViewContoller+Alert.swift
//  tms15
//
//  Created by Ivan Klishevich on 02.08.2021.
//

import UIKit

extension UIViewController {
    func presentAlertControlelr(with title: String?, message: String?, prefferedStyle: UIAlertController.Style = .alert, actions: UIAlertAction...) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: prefferedStyle)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
//        alert.addTextField { textField in
//            print(textField.text)
//        }
        
        actions.forEach { alert.addAction($0) }
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
}
