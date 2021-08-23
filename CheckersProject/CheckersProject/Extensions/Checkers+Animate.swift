//
//  Checkers+Animate.swift
//  CheckersProject
//
//  Created by Ivan Klishevich on 15.08.2021.
//

import UIKit

extension Checkers {
    func animateScreen() {
        UIImageView.animateKeyframes(withDuration: 0.75, delay: 0.35, options: []) {
            self.frameChessboard.center.x = self.view.center.x
            self.timerLabel.center.x = self.view.center.x + 10
            self.newGameBtn.transform = .identity
            self.settingsBtn.transform = .identity
            self.resultsBtn.transform = .identity
            self.setShadow(where: self.frameChessboard)
//            self.newGameConstraint.constant = 16
//            self.view.layoutIfNeeded()
        } completion: { _ in
            self.chessboard.subviews.forEach { cell in
                guard cell.tag != 0 else { return }
                
                cell.subviews.forEach { checker in
                    UIView.animate(withDuration: 0.75) {
                        checker.transform = .identity
                    }
                }
            }
            UIView.animate(withDuration: 0.75) {
                self.whoStepView.transform = .identity
            }
        }
    }
}
