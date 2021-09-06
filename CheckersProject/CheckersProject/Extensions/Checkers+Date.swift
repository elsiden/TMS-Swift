//
//  Checkers+Date.swift
//  CheckersProject
//
//  Created by Ivan Klishevich on 31.08.2021.
//

import UIKit

extension Checkers {
    func setDate() {
        let startGameDate: Date = Date()
        dataDate = dateFormatter.string(from: startGameDate)
    }
}
