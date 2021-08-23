//
//  Checkers+Create.swift
//  CheckersProject
//
//  Created by Ivan Klishevich on 13.08.2021.
//

import UIKit

extension Checkers {
    func createChessboard() {
        let size = view.bounds.size.width - 40
        var tagCell: Int = 0
        
        chessboard = UIView(frame: CGRect(x: 14, y: 14, width: size - 28, height: size - 28))
        
        let sizeCell = (size - 28) / 8
        for row in 0..<8 {
            for column in 0..<8 {
                let cell = UIImageView(frame: CGRect(x: sizeCell * CGFloat(column), y: sizeCell * CGFloat(row), width: sizeCell, height: sizeCell))
                if ((row + column) % 2) != 0 {
                    tagCell += 1
                    cell.tag = tagCell
                }
                cell.image = UIImage(named: cell.tag == 0 ? theme.lightCell : theme.darkCell)
                cell.isUserInteractionEnabled = true
                chessboard.addSubview(cell)
                
                
                let checker = UIImageView(frame: CGRect(x: 3, y: 3, width: sizeCell - 6, height: sizeCell - 6))
                checker.isUserInteractionEnabled = true
                checker.transform = checker.transform.scaledBy(x: 0.0, y: 0.0)
                
                let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressGesture(_:)))
                longPressGesture.minimumPressDuration = 0.05
                longPressGesture.delegate = self
                checker.addGestureRecognizer(longPressGesture)
                
                let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
                panGesture.delegate = self
                checker.addGestureRecognizer(panGesture)
                
                guard cellAndChecker.isEmpty else {
                    if let position = cellAndChecker.first(where: {$0.cellTag == cell.tag}) {
                        checker.tag = position.checkerTag ?? 0
                        checker.image = UIImage(named: checker.tag == 0 ? "white" : "black")
                        cell.addSubview(checker)
                    }
                    continue
                }
                
                guard row < 3 || row > 4, cell.tag != 0 else { continue }
                
                checker.image = UIImage(named: row < 3 ? "black" : "white")
                checker.tag = row < 3 ? CheckersStep.black.rawValue : CheckersStep.white.rawValue
                cell.addSubview(checker)
            }
        }

        whoStepImage.image = UIImage(named: whoStep == .white ? "white" : "black")
        whoStepView.backgroundColor = UIColor(cgColor: CGColor(red: 250 / 255, green: 250 / 255, blue: 250 / 255, alpha: 0.3))
        whoStepView.layer.cornerRadius = 10
        whoStepView.transform = whoStepView.transform.scaledBy(x: 0.0, y: 0.0)
//        settingsView.backgroundColor = UIColor(cgColor: CGColor(red: 250 / 255, green: 250 / 255, blue: 250 / 255, alpha: 0.5))
//        settingsView.layer.cornerRadius = 20
        frameChessboard = UIImageView(frame: CGRect(x: -size, y: 0, width: size, height: size))
        frameChessboard.image = UIImage(named: "chessboardFrame")
        frameChessboard.isUserInteractionEnabled = true
        frameChessboard.center.y = view.center.y
        frameChessboard.backgroundColor = .black
        view.addSubview(frameChessboard)
        frameChessboard.addSubview(chessboard)
    }
    
    func create(where view: UIView) {
        view.center.y = self.view.center.y
        view.isHidden = false
        view.layer.zPosition = 1
    }
    
    func createSettings() {
        create(where: settingsView)
        settingsView.frame.origin.x = view.bounds.size.width
    }
    
    func createResults() {
        create(where: resultsView)
        resultsView.frame.origin.x = -resultsView.bounds.size.width
    }
    
    func createNewGame() {
        stopTimer()
        timer = nil
        
        frameChessboard.removeFromSuperview()
        timerLabel.removeFromSuperview()
        seconds = 0
        
        isFirstStep = true
        whoStep = .white
        createTimer()
        createChessboard()
        animateScreen()
    }
    
    func createGame() {
        createChessboard()
        createTimer()
        createButtons()
        animateScreen()
    }
    
    func createButtons() {
        newGameBtn.transform = newGameBtn.transform.scaledBy(x: 0.0, y: 0.0)
        settingsBtn.transform = settingsBtn.transform.scaledBy(x: 0.0, y: 0.0)
        resultsBtn.transform = resultsBtn.transform.scaledBy(x: 0.0, y: 0.0)
    }
    
    func createThemes() {
        let theme1 = Theme(themeTitle: "darkWoodBg", cellsTitle: "woodCells", lightCell: "lightWoodCell", darkCell: "darkWoodCell")
        let theme2 = Theme(themeTitle: "darkBlueBg", cellsTitle: "blueCells", lightCell: "lightBlueCell", darkCell: "darkBlueCell")
        
        themes.append(theme1)
        themes.append(theme2)
    }
    
    //    func createButtons() {
    //        newGameConstraint.constant = -newGameBtn.bounds.size.width
    //        newGameBtn.frame.origin.x = -newGameBtn.bounds.size.width
    //    }
    
}
