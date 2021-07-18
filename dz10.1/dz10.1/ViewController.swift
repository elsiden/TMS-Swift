//
//  ViewController.swift
//  dz10.1
//
//  Created by Ivan Klishevich on 17.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let chessView = UIView(frame: CGRect(x: 30, y: 200, width: 320, height: 320))
    var currentView: UIView? = nil
    var fields: [UIView] = []
    var checkers: [UIView] = []
    var tapPoint: CGPoint = .zero
    var startPositionChangeChecker: CGPoint = .zero
    var selectedField: CGPoint = .zero
    var countCheckers: Int = 0
    var count: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
        view.addGestureRecognizer(panGesture)
        
        createChessboard()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.tapPoint = touches.first?.location(in: view) ?? .zero
    }
    
    func createChessboard() {
        let rows = 8
        let columns = 8
        let squareSize = CGSize(width: 40, height: 40)
        let xOffset = 30
        let yOffset = 200
        var check = false
        
        let squareMiniSize = CGSize(width: 26, height: 26)
        let xOffsetMini = 7
        let yOffsetMini = 7
        var squareMiniPos: CGPoint
        var squareMini: UIView

        for row in 0...rows-1 {
            for col in 0...columns-1 {
                let color = check ? UIColor.black : UIColor.white

                let squarePos = CGPoint(x: CGFloat(col) * squareSize.width + CGFloat(xOffset), y: CGFloat(row) * squareSize.height + CGFloat(yOffset))
                let square = UIView(frame: CGRect(origin: squarePos, size: squareSize))
                square.backgroundColor = color

                view.addSubview(square)
                
                if color == .black {
                    fields.append(square)
                }
                if color == .black && (row < 3 || row > 4) {
                    if row % 2 == 0 && col == 1 {
                        squareMiniPos = CGPoint(x: CGFloat(xOffset) + CGFloat(xOffsetMini) + squareSize.width, y: CGFloat(yOffset) + CGFloat(yOffsetMini) + CGFloat(row) * squareSize.height)
                    } else if row % 2 == 1 && col == 0 {
                        squareMiniPos = CGPoint(x: CGFloat(xOffset) + CGFloat(xOffsetMini), y: CGFloat(yOffset) + CGFloat(yOffsetMini) + CGFloat(row) * squareSize.height)
                    } else {
                        squareMiniPos = CGPoint(x: CGFloat(xOffset) + CGFloat(xOffsetMini) + squareSize.width * CGFloat(col), y: CGFloat(yOffset) + CGFloat(yOffsetMini) + CGFloat(row) * squareSize.height)
                    }
                    squareMini = UIView(frame: CGRect(origin: squareMiniPos, size: squareMiniSize))
                    if row < 3 {
                        squareMini.backgroundColor = UIColor.darkGray
                    } else {
                        squareMini.backgroundColor = UIColor.lightGray
                    }
                    squareMini.layer.cornerRadius = 13
                    squareMini.layer.masksToBounds = true
                    view.addSubview(squareMini)
                    checkers.append(squareMini)
                }
                check = !check
            }
            check = !check
        }
    }
    
    @objc
    func panGesture(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        switch sender.state {
        case .began:
            for value in checkers {
                if value.frame.contains(self.tapPoint) {
                    currentView = value
                    startPositionChangeChecker = value.frame.origin
                }
            }
        case .changed:
            guard currentView != nil else { return }
            view.bringSubviewToFront(currentView!)
            currentView!.center = CGPoint(x: currentView!.center.x + translation.x, y: currentView!.center.y + translation.y)
            sender.setTranslation(.zero, in: view)
        case .ended:
            guard currentView != nil else { return }
            if !chessView.frame.contains(currentView!.frame) {
                currentView!.frame.origin = startPositionChangeChecker
            }
            
            for value in fields {
                count += 1
                if value.frame.contains(currentView!.frame) {
                    selectedField = value.frame.origin
                    currentView!.frame.origin.x = selectedField.x + 7
                    currentView!.frame.origin.y = selectedField.y + 7
                    count = 0
                    for checker in checkers {
                        if currentView!.frame.origin == checker.frame.origin {
                            countCheckers += 1
                            if countCheckers == 2 {
                                currentView!.frame.origin = startPositionChangeChecker
                                break
                            }
                        }
                    }
                    break
                } else if count == 32 {
                    count = 0
                    currentView!.frame.origin = startPositionChangeChecker
                }
            }
            countCheckers = 0
            currentView = nil
        default:
            break
        }
    }
}


