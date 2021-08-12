//
//  ViewController.swift
//  dz12
//
//  Created by Ivan Klishevich on 22.07.2021.
//

import UIKit

enum CheckerStep: Int {
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
    
    var tagCell: Int = 0
    var tagChecker: Int = 0
    
    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let ud = UserDefaults.standard
    var cellAndChecker: [Checker] = []
    
    var isLong = false
    
    var whoStepNext: CheckerStep = .white
    var whoStepNow: CheckerStep = .white
    
    var alertController: UIAlertController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(setBackground())
        
        presentAlertController(with: "Start a new batch or continue last?", message: "If you start a new game, old will be deleted", actions: UIAlertAction(title: "Continue", style: .default, handler: { _ in
            self.getLastBatch()
            self.setDataFromUserDefaults()
            self.createTimer()
            self.createOldChessboard()
            do {
                let fileURL = self.documentDirectory.appendingPathComponent(KeysUserDefaults.cellAndChecker.rawValue)
                try FileManager.default.removeItem(at: fileURL)
            } catch {
                print()
            }
            self.cellAndChecker.removeAll()
            

//            self.createChessboard()
        }), UIAlertAction(title: "Start new", style: .destructive, handler: { _ in
            self.removeDataFromUserDefaults()
            self.createTimer()
            self.createChessboard()
        }))
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
        timer = nil
    }
    
    func createTimer() {
        timer = Timer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
        
        let attrs: [NSAttributedString.Key: Any] = [ .foregroundColor : UIColor.white,
                                                    .font: UIFont.dited(with: 50.0) ]
        
        let timerView = UIView(frame: CGRect(x: view.center.x, y: 130, width: 170, height: 75))
        timerView.center.x = view.center.x
        timerView.backgroundColor = UIColor(cgColor: CGColor(red: 60 / 255, green: 60 / 255, blue: 60 / 255, alpha: 1))
        timerView.layer.borderWidth = 5
        timerView.layer.borderColor = CGColor(red: 40 / 255, green: 40 / 255, blue: 40 / 255, alpha: 1)
        view.addSubview(timerView)
        
        labelTimer = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: 130, height: 75)))
        labelTimer.frame.origin.x += 20
        
        if countMin > 0 || countSec > 0 {
            var sec: String
            var min: String
            sec = countSec < 10 ? ": 0\(countSec)" : ": \(countSec)"
            min = countMin < 10 ? "0\(countMin) " : "\(countMin) "
            labelTimer.attributedText = NSAttributedString(string: min + sec, attributes: attrs)
        } else {
            labelTimer.attributedText = NSAttributedString(string: "0\(countMin) : 0\(countSec)", attributes: attrs)
        }
        
        labelTimer.textAlignment = .center
        timerView.addSubview(labelTimer)
    }
    
    func createChessboard() {
        let size = view.bounds.size.width - 40
        chessboard = UIView(frame: CGRect(origin: .zero, size: CGSize(width: size, height: size)))
        chessboard.backgroundColor = .white
        
        let sizeColumn = (size - 20) / 8
        for i in 0..<8 {
            for j in 0..<8 {
                let column = UIView(frame: CGRect(x: sizeColumn * CGFloat(j) + 10, y: sizeColumn * CGFloat(i) + 10, width: sizeColumn, height: sizeColumn))
                column.backgroundColor = ((i + j) % 2) == 0 ? .white : .brown
                column.tag = ((i + j) % 2) == 0 ? 0 : tagCell
                
                if ((i + j) % 2) == 1 {
                    tagCell += 1
                    column.tag = tagCell
                }
                chessboard.addSubview(column)
                
                guard i < 3 || i > 4, column.backgroundColor == .brown else { continue }
                
                let checker = UIImageView(frame: CGRect(x: 2, y: 2, width: sizeColumn - 5, height: sizeColumn - 5))
                checker.isUserInteractionEnabled = true
                checker.image = i < 3 ? UIImage(named: "black_cro") : UIImage(named: "white_cro")
                checker.tag = i < 3 ? CheckerStep.black.rawValue : CheckerStep.white.rawValue
                
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
    
    func saveBatch() {
        chessboard.subviews.forEach { cell in
            if !cell.subviews.isEmpty {
                let position: Checker = Checker()
                position.cellTag = cell.tag
                cell.subviews.forEach { checker in
                    position.checkerTag = checker.tag
                }
                cellAndChecker.append(position)
            }
        }
        let data = try? NSKeyedArchiver.archivedData(withRootObject: cellAndChecker, requiringSecureCoding: true)

        let fileURL = documentDirectory.appendingPathComponent(KeysUserDefaults.cellAndChecker.rawValue)
        try? data?.write(to: fileURL)
    }

    func getLastBatch() {
        let fileURL = documentDirectory.appendingPathComponent(KeysUserDefaults.cellAndChecker.rawValue)
        guard let data = FileManager.default.contents(atPath: fileURL.absoluteString.replacingOccurrences(of: "file://", with: "")),
              let object = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Checker] else { return }
        self.cellAndChecker = object
    }
    
    func createOldChessboard() {
        let size = view.bounds.size.width - 40
        chessboard = UIView(frame: CGRect(origin: .zero, size: CGSize(width: size, height: size)))
        chessboard.backgroundColor = .white
        
        let sizeColumn = (size - 20) / 8
        for i in 0..<8 {
            for j in 0..<8 {
                let column = UIView(frame: CGRect(x: sizeColumn * CGFloat(j) + 10, y: sizeColumn * CGFloat(i) + 10, width: sizeColumn, height: sizeColumn))
                column.backgroundColor = ((i + j) % 2) == 0 ? .white : .brown
                column.tag = ((i + j) % 2) == 0 ? 0 : tagCell
                
                if ((i + j) % 2) == 1 {
                    tagCell += 1
                    column.tag = tagCell
                }
                chessboard.addSubview(column)

                for value in cellAndChecker {
                    if column.tag == value.cellTag {
                        let checker = UIImageView(frame: CGRect(x: 2, y: 2, width: sizeColumn - 5, height: sizeColumn - 5))
                        checker.isUserInteractionEnabled = true
                        checker.image = value.checkerTag == 1 ? UIImage(named: "black_cro") : UIImage(named: "white_cro")
                        checker.tag = value.checkerTag == 1 ? CheckerStep.black.rawValue : CheckerStep.white.rawValue
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
            }
        }
        chessboard.layer.borderWidth = 10
        chessboard.layer.borderColor = CGColor(red: 40 / 255, green: 40 / 255, blue: 40 / 255, alpha: 1)
        view.addSubview(chessboard)
        chessboard.center = view.center
    }
    
    @IBAction func startNewGame(_ sender: UIButton) {
        timer?.invalidate()
        presentAlertController(with: "Start a new batch?", message: "If you start a new game, old will be deleted", actions: UIAlertAction(title: "Continue", style: .default, handler: { _ in
            self.timer = Timer(timeInterval: 1, target: self, selector: #selector(self.timerFunc), userInfo: nil, repeats: true)
            RunLoop.main.add(self.timer!, forMode: .common)
        }),
            UIAlertAction(title: "Start new", style: .destructive, handler: { _ in
                self.removeDataFromUserDefaults()
                self.chessboard.removeFromSuperview()
                self.labelTimer.removeFromSuperview()
                self.timer = nil
                self.countSec = 0
                self.countMin = 0
                
                self.createChessboard()
                self.createTimer()
        }))
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
        labelTimer.textAlignment = .center
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
            if !defaultCell!.contains(cell) {
                whoStepNext = whoStepNext == .white ? .black : .white
            }
            
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
    
    @IBAction override func backButtonAction(_ sender: UIButton) {
        timer?.invalidate()
        presentAlertController(with: "Save game?", message: "", actions: UIAlertAction(title: "Yes", style: .default, handler: { _ in
            self.saveDataToUserDefaults()
            self.saveBatch()
            self.navigationController?.popViewController(animated: true)
        }), UIAlertAction(title: "No", style: .destructive, handler: { _ in
            self.removeDataFromUserDefaults()
            self.navigationController?.popViewController(animated: true)
        }))
    }
    
    func saveDataToUserDefaults() {
        ud.setValue(countSec, forKey: KeysUserDefaults.timerSec.rawValue)
        ud.setValue(countMin, forKey: KeysUserDefaults.timerMin.rawValue)
    }
    
    func removeDataFromUserDefaults() {
        ud.removeObject(forKey: KeysUserDefaults.timerSec.rawValue)
        ud.removeObject(forKey: KeysUserDefaults.timerMin.rawValue)
    }
    
    func setDataFromUserDefaults() {
        self.countSec = ud.integer(forKey: KeysUserDefaults.timerSec.rawValue)
        self.countMin = ud.integer(forKey: KeysUserDefaults.timerMin.rawValue)
    }
}

extension ChessboardVC: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

