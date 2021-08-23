//
//  Checkers.swift
//  CheckersProject
//
//  Created by Ivan Klishevich on 13.08.2021.
//

import UIKit

enum CheckersStep: Int {
    case white = 0
    case black = 1
}

class Checkers: UIViewController {
    
    @IBOutlet weak var newGameBtn: UIButton!
    @IBOutlet weak var settingsBtn: UIButton!
    @IBOutlet weak var resultsBtn: UIButton!
    
    @IBOutlet weak var timerSwitch: UISwitch!

    @IBOutlet weak var settingsView: UIView!
    @IBOutlet weak var resultsView: UIView!
    @IBOutlet weak var whoStepImage: UIImageView!
    @IBOutlet weak var whoStepView: UIView!
    @IBOutlet weak var collectionTheme: UICollectionView!
    
    var chessboard: UIView!
    var frameChessboard: UIImageView!
    var defaultCell: UIView?
    var isLong = false
    var isFirstStep = true
    var whoStep: CheckersStep = .white
    var cellAndChecker: [CheckerInfo] = []
    
    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let ud = UserDefaults.standard
    
    var timer: Timer?
    var seconds: Int = 0
    var timerLabel: UILabel!
    
    var theme: Theme = Theme()
    var themes: [Theme] = []
    var background: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkSaveFile()
        view.addSubview(setBackground(where: theme.themeTitle))
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        saveDataToUserDefaults()
        saveGamePositions()
        saveTheme()
    }
}
