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
    
    func endGame(where winner: CheckersColor) {
        let whoWin = winner == .white ? "White" : "Black"
        stopTimer()
        presentAlertController(with: "\(whoWin) wins", message: "Do you want to start a new game?", actions: UIAlertAction(title: "Yes", style: .default, handler: { _ in
            self.removeDataFromUserDefaults()
            self.removeSavePositions()
            self.createNewGame()
        }), UIAlertAction(title: "No", style: .cancel, handler: { _ in
            
        }))
    }
}
