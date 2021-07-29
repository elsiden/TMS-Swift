//
//  ViewController.swift
//  dz12
//
//  Created by Ivan Klishevich on 22.07.2021.
//

import UIKit

enum checkerStep: Int {
    case white = 0
    case black = 1
}

class ChessboardVC: UIViewController {
    var chessboard: UIView!
    var defaultCell: UIView?
    
    var countSec: Int = 0
    var countMin: Int = 0
    var timer: Timer?
    var labelTimer: UILabel!
    
    var isLong = false
    
    var whoStepNext: checkerStep = .white
    var whoStepNow: checkerStep = .white
    
    @IBOutlet weak var navBarView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(setBackground())
        
        createChessboard()
        navBarView.layer.zPosition = 1
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
        timer = nil
    }
    
    override func viewDidLayoutSubviews() {
        chessboard.center = view.center
    }
    
    func  createTimer() {
        timer = Timer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
        
        labelTimer = UILabel(frame: CGRect(x: view.center.x - 15, y: 100, width: 100, height: 50))
        labelTimer.text = "0\(countMin) : 0\(countSec)"
        view.addSubview(labelTimer)
    }
    
    func createChessboard() {
        let size = view.bounds.size.width - 40
        chessboard = UIView(frame: CGRect(origin: .zero, size: CGSize(width: size, height: size)))
        chessboard.backgroundColor = .white
        
        let sizeColumn = (size - 20) / 8
        for i in 0..<8 {
            for j in 0..<8 {
                let column = UIView(frame: CGRect(x: sizeColumn * CGFloat(i) + 10, y: sizeColumn * CGFloat(j) + 10, width: sizeColumn, height: sizeColumn))
                column.backgroundColor = ((i + j) % 2) == 0 ? .white : .brown
                chessboard.addSubview(column)
                
                guard j < 3 || j > 4, column.backgroundColor == .brown else { continue }
                
                let checker = UIImageView(frame: CGRect(x: 2, y: 2, width: sizeColumn - 5, height: sizeColumn - 5))
                checker.isUserInteractionEnabled = true
                checker.image = j < 3 ? UIImage(named: "black_cro") : UIImage(named: "white_cro")
                checker.tag = j < 3 ? checkerStep.black.rawValue : checkerStep.white.rawValue
                column.addSubview(checker)
                
                let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
                panGesture.delegate = self
                checker.addGestureRecognizer(panGesture)
                
                let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressGesture(_:)))
                longPressGesture.minimumPressDuration = 0.1
                longPressGesture.delegate = self
                checker.addGestureRecognizer(longPressGesture)
            }
        }
        chessboard.layer.borderWidth = 10
        chessboard.layer.borderColor = CGColor(red: 40 / 255, green: 40 / 255, blue: 40 / 255, alpha: 1)
        view.addSubview(chessboard)
        chessboard.center = view.center
    }
    
    @IBAction func startNewGame(_ sender: UIButton) {
        chessboard.removeFromSuperview()
        labelTimer.removeFromSuperview()
        timer?.invalidate()
        timer = nil
        countSec = 0
        countMin = 0
        
        createChessboard()
        createTimer()
    }
    
    @objc func timerFunc() {
        var sec: String
        var min: String
        countSec += 1
        if countSec == 60 {
            countSec = 0
            countMin += 1
        }
        sec = countSec < 10 ? ": 0\(countSec)" : ": \(countSec)"
        min = countMin < 10 ? "0\(countMin) " : "\(countMin) "
        labelTimer.text = min + sec
    }
    
    @objc func panGesture(_ sender: UIPanGestureRecognizer) {
        guard isLong else { return }
        
        let location = sender.location(in: chessboard)
        let translation = sender.translation(in: chessboard)

        switch sender.state {
        case .began:
            guard let checker = sender.view else { return }

            let convertOrigin = checker.convert(checker.frame.origin, to: view)
            defaultCell = checker.superview
            view.addSubview(checker)
            checker.frame.origin = convertOrigin
        case .changed:
            guard let cellOrigin = sender.view?.frame.origin else { return }
            
            sender.view?.frame.origin = CGPoint(x: cellOrigin.x + translation.x,
                                                y: cellOrigin.y + translation.y)
            sender.setTranslation(.zero, in: chessboard)
        case .ended:
            let currentCell = chessboard.subviews.first(where: {$0.frame.contains(location) &&
                                                            $0.backgroundColor == .brown })
            
            guard let newCell = currentCell, newCell.subviews.isEmpty, let cell = sender.view else {
                guard let checker = sender.view else { return }
                defaultCell?.addSubview(checker)
                return
            }
            
            currentCell?.addSubview(cell)
            whoStepNext = whoStepNext == .white ? .black : .white
        default: break
        }
    }
    
    @objc func longPressGesture(_ sender: UILongPressGestureRecognizer) {
        guard let checker = sender.view, whoStepNow.rawValue == checker.tag else { return }
        switch sender.state {
        case .began:
            isLong = true
            UIView.animate(withDuration: 0.3) {
                checker.transform = checker.transform.scaledBy(x: 1.3, y: 1.3)
            }
        case .ended:
            isLong = false
            UIView.animate(withDuration: 0.3) {
                checker.transform = .identity
            }
            sender.view?.frame.origin = CGPoint(x: 2, y: 2)
            whoStepNow = whoStepNext
        default:
            break
        }
    }
}

extension ChessboardVC: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

