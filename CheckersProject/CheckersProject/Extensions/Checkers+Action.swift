//
//  ViewController+Action.swift
//  CheckersProject
//
//  Created by Ivan Klishevich on 13.08.2021.
//

import UIKit

extension Checkers: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    @IBAction func newGameBtn(_ sender: UIButton) {
        stopTimer()
        presentAlertController(with: "Start a new game?", message: "All your data will be deleted", actions: UIAlertAction(title: "Yes", style: .destructive, handler: { _ in
            self.removeDataFromUserDefaults()
            self.createNewGame()
        }), UIAlertAction(title: "No", style: .default, handler: { _ in
            self.isFirstStep = true
        })) 
    }
    
    @IBAction func settingsBtn(_ sender: UIButton) {
        actionWithMenuElements(where: settingsView, firstBtn: newGameBtn, secondBtn: resultsBtn, position: self.view.bounds.size.width)
    }
    
    @IBAction func resultsBtn(_ sender: UIButton) {
        actionWithMenuElements(where: resultsView, firstBtn: newGameBtn, secondBtn: settingsBtn, position: -self.resultsView.bounds.size.width)
    }
    
    func actionWithMenuElements(where view: UIView, firstBtn: UIButton, secondBtn: UIButton, position: CGFloat) {
        if view.isHidden == true {
            if position == self.view.bounds.size.width {
                createSettings()
            } else {
                createResults()
            }
            
            UIView.animate(withDuration: 0.5, delay: 0.0, options: []) {
                view.center.x = self.view.center.x
                self.stopTimer()
                self.frameChessboard.transform = self.frameChessboard.transform.scaledBy(x: 0.001, y: 0.001)
                self.timerLabel.transform = self.timerLabel.transform.scaledBy(x: 0.001, y: 0.001)
                self.whoStepView.transform = self.whoStepView.transform.scaledBy(x: 0.001, y: 0.001)
                firstBtn.transform = firstBtn.transform.scaledBy(x: 0.001, y: 0.001)
                secondBtn.transform = secondBtn.transform.scaledBy(x: 0.001, y: 0.001)
            } completion: { _ in }
        } else {
            UIView.animate(withDuration: 0.5, delay: 0.0, options: []) {
                view.frame.origin.x = position
                self.frameChessboard.transform = .identity
                self.timerLabel.transform = .identity
                self.whoStepView.transform = .identity
                firstBtn.transform = .identity
                secondBtn.transform = .identity
            } completion: { _ in
                view.isHidden = true
                self.isFirstStep = true
            }
        }
    }
    
    func changeTheme(theme: Theme) {
        background?.removeFromSuperview()
        view.addSubview(setBackground(where: theme.themeTitle))
        chessboard.subviews.forEach { cell in
            (cell as? UIImageView)?.image = UIImage(named: cell.tag == 0 ? theme.lightCell : theme.darkCell)
        }
        
        self.theme = theme
    }
    
    @objc func longPressGesture(_ sender: UILongPressGestureRecognizer) {
        guard let checker = sender.view, let cell = checker.superview, whoStep.rawValue == checker.tag else { return }
        switch sender.state {
        case .began:
            isLong = true
            chessboard.bringSubviewToFront(cell)
            UIView.animate(withDuration: 0.3) {
                checker.transform = checker.transform.scaledBy(x: 1.2, y: 1.2)
            }
        case .ended:
            UIView.animate(withDuration: 0.3) {
                checker.transform = .identity
            }
            sender.view?.frame.origin = CGPoint(x: 3, y: 3)
        default:
            break
        }
    }
    
    @objc func panGesture(_ sender: UIPanGestureRecognizer) {
        guard isLong else { return }
        
        let location = sender.location(in: chessboard)
        let translation = sender.translation(in: chessboard)
        
        switch sender.state {
        case .began:
            guard let checker = sender.view else { return }
            if isFirstStep == true {
                startTimer()
                isFirstStep = false
            }
            
            let convertOrigin = checker.convert(checker.frame.origin, to: view)
            defaultCell = checker.superview
            view.addSubview(checker)
            checker.frame.origin = convertOrigin
        case .changed:
            guard let cellOrigin = sender.view?.frame.origin else { return }
            
            sender.view?.frame.origin = CGPoint(x: cellOrigin.x + translation.x, y: cellOrigin.y + translation.y)
            sender.setTranslation(.zero, in: chessboard)
        case .ended:
            isLong = false
            let currentCell = chessboard.subviews.first(where: {$0.frame.contains(location) && $0.tag != 0 })
            
            guard let newCell = currentCell, newCell.subviews.isEmpty, let cell = sender.view else {
                guard let checker = sender.view else { return }
                defaultCell?.addSubview(checker)
                return
            }
            chessboard.bringSubviewToFront(newCell)
            newCell.addSubview(cell)
            
            if !defaultCell!.contains(cell) {
                whoStep = whoStep == .white ? .black : .white
                whoStepImage.image = UIImage(named: whoStep == .white ? "white" : "black")
            }
        
        default: break
        }
        
    }
    
}
