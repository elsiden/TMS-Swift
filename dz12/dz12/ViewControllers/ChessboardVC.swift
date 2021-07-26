//
//  ViewController.swift
//  dz12
//
//  Created by Ivan Klishevich on 22.07.2021.
//

import UIKit

class ChessboardVC: UIViewController {
    var chessboard: UIView!
    var defaultCell: UIView?
    
    var countSec: Int = 0
    var countMin: Int = 0
    var countHour: Int = 0
    var timer: Timer?
    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(image: UIImage(named: "bg"))
        let ImageViewSize = CGSize(width: view.bounds.size.width, height: view.bounds.size.height)
        imageView.frame = CGRect(origin: .zero, size: ImageViewSize)
        view.addSubview(imageView)
        
        timer = Timer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
        
        label = UILabel(frame: CGRect(x: view.center.x - 15, y: 100, width: 100, height: 50))
        label.text = "\(countHour):\(countMin):\(countSec)"
        view.addSubview(label)
        
        createChessboard()
    }
    
    override func viewDidLayoutSubviews() {
        chessboard.center = view.center
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
                column.addSubview(checker)
                
                let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
                checker.addGestureRecognizer(panGesture)
            }
        }
        chessboard.layer.borderWidth = 10
        chessboard.layer.borderColor = CGColor(red: 40 / 255, green: 40 / 255, blue: 40 / 255, alpha: 1)
        view.addSubview(chessboard)
        chessboard.center = view.center
    }
    
    @objc func timerFunc() {
        countSec += 1
        if countSec == 60 {
            countSec = 0
            countMin += 1
            if countMin == 60 {
                countMin = 0
                countHour += 1
            }
        }
        label.text = "\(countHour):\(countMin):\(countSec)"
    }
    
    @objc func panGesture(_ sender: UIPanGestureRecognizer) {
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
            
            sender.view?.frame.origin = CGPoint(x: 2, y: 2)
            guard let newCell = currentCell, newCell.subviews.isEmpty, let cell = sender.view else {
                guard let checker = sender.view else { return }
                defaultCell?.addSubview(checker)
                return
            }
            
            currentCell?.addSubview(cell)
        default: break
        }
    }
}
