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
            self.removeSavePositions()
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
        self.stopTimer()
        if view.isHidden == true {
            if position == self.view.bounds.size.width {
                createSettings()
            } else {
                createResults()
            }
            
            UIView.animate(withDuration: 0.5, delay: 0.0, options: []) {
                view.center.x = self.view.center.x
                self.frameChessboard.transform = self.frameChessboard.transform.scaledBy(x: 0.001, y: 0.001)
                self.timerLabel.transform = self.timerLabel.transform.scaledBy(x: 0.001, y: 0.001)
                self.whoStepView.transform = self.whoStepView.transform.scaledBy(x: 0.001, y: 0.001)
                self.whoStepLabel.transform = self.whoStepLabel.transform.scaledBy(x: 0.001, y: 0.001)
                firstBtn.transform = firstBtn.transform.scaledBy(x: 0.001, y: 0.001)
                secondBtn.transform = secondBtn.transform.scaledBy(x: 0.001, y: 0.001)
            } completion: { _ in }
        } else {
            UIView.animate(withDuration: 0.5, delay: 0.0, options: []) {
                view.frame.origin.x = position
                self.frameChessboard.transform = .identity
                self.timerLabel.transform = .identity
                self.whoStepView.transform = .identity
                self.whoStepLabel.transform = .identity
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
        saveTheme()
    }
    
    func clearTextField(first: UITextField, second: UITextField) {
        first.text = ""
        first.resignFirstResponder()
        second.text = ""
        second.resignFirstResponder()
    }
    
    @objc func longPressGesture(_ sender: UILongPressGestureRecognizer) {
        var step: Bool = false
        var steps: [Int] = []
        
        if beatSteps.isEmpty {
            if whoStep.rawValue == 0 {
                steps = [12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]
            } else {
                steps = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
            }
        } else {
            for step in beatSteps {
                steps.append(step[0])
            }
        }
        
        for value in steps {
            if value == sender.view?.tag {
                step = true
                break
            }
        }
        
        guard let checker = sender.view, let cell = checker.superview, step else { return }
        
        switch sender.state {
        case .began:
            isLong = true
            chessboard.bringSubviewToFront(cell)
            
            if steps.count == 12 {
                self.possibleSteps(tag: cell.tag)
            }
            
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
            var steps: [Int] = []
            let currentCell = chessboard.subviews.first(where: {$0.frame.contains(location) && $0.tag != 0})
            if !beatSteps.isEmpty {
                for value in beatSteps {
                    if currentCell?.tag == value[2] && sender.view?.tag == value[0] {
                        steps = value
                        break
                    }
                }
            } else if !possibleSteps.isEmpty {
                for value in possibleSteps {
                    if currentCell?.tag == value {
                        steps.append(value)
                        break
                    }
                }
            }
            
            guard let newCell = currentCell, newCell.subviews.isEmpty, let checker = sender.view, !steps.isEmpty else {
                guard let checker = sender.view else { return }
                defaultCell?.addSubview(checker)
                return
            }
            chessboard.bringSubviewToFront(newCell)
            newCell.addSubview(checker)
            
            if !defaultCell!.contains(checker) {
                if steps.count == 4 {
                    if steps[0] == checker.tag && steps[2] == newCell.tag {
                        let removeCell = chessboard.subviews.first(where: { $0.tag == steps[3] })
                        removeCell?.subviews.forEach{ checker in
                            checker.removeFromSuperview()
                        }
                    }
                }
                
                cellAndChecker.removeAll()
                
                cleanFileWithPositions()
                saveGamePositions()
                saveDataToUserDefaults()
                

                whoStep = whoStep == .white ? .black : .white
                var count = 0
                if whoStep == .white {
                    for chckr in cellAndChecker {
                        count += 1
                        if chckr.checkerTag ?? 0 > 11 {
                            print("resume")
                            break
                        } else if count == cellAndChecker.count {
                            resumeGame = false // ?
                        }
                        
                    }
                } else {
                    for chckr in cellAndChecker {
                        count += 1
                        if chckr.checkerTag ?? 13 < 12 {
                            print("resume")
                            break
                        } else if count == cellAndChecker.count {
                            resumeGame = false // ?
                        }
                    }
                }
                
                if !resumeGame {
                    stopTimer()
                    self.removeDataFromUserDefaults()
                    self.removeSavePositions()
                    self.createNewGame()
                } else {
                    whoStepImage.image = UIImage(named: whoStep == .white ? "whiteChecker" : "blackChecker")
                    whoStepLabel.text = whoStepLabel.text == players[0].playerName ? players[1].playerName : players[0].playerName
                    
                    dynamicChecker.removeAll()
                    beatPositions.removeAll()
                    beatSteps.removeAll()
                    
                    fillDynamicCheckers()
                    fillBeatPositions()
                    fillBeatSteps()
                }
            }
        default: break
        }
        
    }
    
}
