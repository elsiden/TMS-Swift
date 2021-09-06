//
//  Checkers+NotificationCenter.swift
//  CheckersProject
//
//  Created by Ivan Klishevich on 30.08.2021.
//

import UIKit

extension Checkers {
    func addNotificationBackground() {
        NotificationCenter.default.addObserver(self, selector: #selector(didEnterBackgroundNotification(_:)), name: UIApplication.didEnterBackgroundNotification, object: nil)
    }
    
    @objc
    func didEnterBackgroundNotification(_ notification: Notification) {
        saveDataToUserDefaults()
    }
}
