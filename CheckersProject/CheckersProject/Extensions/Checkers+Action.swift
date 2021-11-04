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
    
    func checkEndGame() {
        var count = 0
        if whoStep == .white {
            for chckr in cellAndChecker {
                count += 1
                if chckr.checkerTag ?? 13 < 12 {
                    break
                } else if count == cellAndChecker.count {
                    resumeGame = false // ?
                }
                
            }
        } else {
            for chckr in cellAndChecker {
                count += 1
                if chckr.checkerTag ?? 0 > 11 {
                    break
                } else if count == cellAndChecker.count {
                    resumeGame = false // ?
                }
            }
        }
    }
    
    @objc func longPressGesture(_ sender: UILongPressGestureRecognizer) {
        var step: Bool = false
        var steps: [Int] = []
        
        if beatSteps.isEmpty && kingBeatSteps.isEmpty { // выбор нужных шашех с записью тэгов в массив
            if whoStep == .white {
                steps = [12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]
            } else {
                steps = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
            }
        } else { // запись нужных шашек из доступных в beatSteps или/и kingBeatSteps
            if !beatSteps.isEmpty {
                for step in beatSteps {
                    steps.append(step[0])
                }
            }
            if !kingBeatSteps.isEmpty {
                for step in kingBeatSteps {
                    steps.append(step[0] as! Int)
                }
            }
        }
        
        for value in steps { // проверка на выбор правильной шашки
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
            
            if beatSteps.isEmpty && kingBeatSteps.isEmpty { // вызов possibleSteps если нет доступных ходов в beatSteps и kingBeatSteps
                possibleSteps.removeAll()
                for value in kingCheckers {
                    if value == checker.tag { // заполнение обычных ходов для дамок
                        possibleStepsForUpperLeftKing(tag: cell.tag)
                        possibleStepsForUpperRightKing(tag: cell.tag)
                        possibleStepsForLowerLeftKing(tag: cell.tag)
                        possibleStepsForLowerRightKing(tag: cell.tag)
                        break
                    }
                }
                if possibleSteps.isEmpty {
                    self.possibleSteps(tag: cell.tag)
                }
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
            var steps: [Any] = []
            let currentCell = chessboard.subviews.first(where: {$0.frame.contains(location) && $0.tag != 0})
            if !beatSteps.isEmpty || !kingBeatSteps.isEmpty { // запись в переменную steps значений о ходе и битье
                if !beatSteps.isEmpty {
                    for value in beatSteps { // учитываю, что до этого была произведена фильтрация и в массивах нет повторяющихся значений
                        if currentCell?.tag == value[2] && sender.view?.tag == value[0] {
                            steps = value
                            break
                        }
                    }
                }
                if !kingBeatSteps.isEmpty {
                    for value in kingBeatSteps {
                        for cell in value[2] as! [Int] {
                            if currentCell?.tag == cell && sender.view?.tag == value[0] as? Int {
                                steps = value
                                steps[2] = cell
                                break
                            }
                        }
                    }
                }
            } else if !possibleSteps.isEmpty { // запись в переменную steps значений о ходе
                for value in possibleSteps {
                    if currentCell?.tag == value {
                        steps.append(value)
                        possibleSteps.removeAll()
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
            
            if !defaultCell!.contains(checker) { // проверка не вернулась ли шашка на стартовую позицию
                if steps.count == 4 && steps[0] as! Int == checker.tag && steps[2] as! Int == newCell.tag { // проверка перед удалением шашки
                    let removeCell = chessboard.subviews.first(where: { $0.tag == steps[3] as! Int })
                    removeCell?.subviews.forEach{ checker in
                        checker.removeFromSuperview()
                        
                        doubleStep[0] = true
                        doubleStep[1] = steps[0]
                        
                        for king in kingCheckers {
                            if checker.tag == king {
                                kingCheckers = kingCheckers.filter { $0 != checker.tag }
                            }
                        }
                    }
                }
                
                cellAndChecker.removeAll()
                
                if whoStep == .white && (newCell.tag == 1 || newCell.tag == 2 || newCell.tag == 3 || newCell.tag == 4) {
                    kingCheckers.append(checker.tag)
                } else if whoStep == .black && (newCell.tag == 29 || newCell.tag == 30 || newCell.tag == 31 || newCell.tag == 32) {
                    kingCheckers.append(checker.tag)
                }
                
                cleanFileWithPositions()
                saveGamePositions()
                saveDataToUserDefaults()
                checkEndGame()
                                
                if !resumeGame {
                    let winner = whoStep == .white ? "White" : "Black"
                    stopTimer()
                    presentAlertController(with: "\(winner) wins", message: "Do you want to start a new game?", actions: UIAlertAction(title: "Yes", style: .default, handler: { _ in
                        self.removeDataFromUserDefaults()
                        self.removeSavePositions()
                        self.createNewGame()
                    }), UIAlertAction(title: "No", style: .cancel, handler: { _ in
                        
                    }))
                } else {
                    if doubleStep[0] as! Bool {
                        fillBeatsAction()
                        beatSteps = filterForDoubleStep(where: doubleStep[1] as! Int)
                    }
                    
                    if beatSteps.isEmpty {
                        doubleStep[0] = false
                        doubleStep[1] = -1
                        whoStep = whoStep == .white ? .black : .white
                        
                        whoStepImage.image = UIImage(named: whoStep == .white ? "whiteChecker" : "blackChecker")
                        whoStepLabel.text = whoStepLabel.text == players[0].playerName ? players[1].playerName : players[0].playerName
                        
                        fillBeatsAction()
                    }
                }
            }
        default: break
        }
    }
    
}
