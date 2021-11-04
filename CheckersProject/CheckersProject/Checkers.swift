//
//  Checkers.swift
//  CheckersProject
//
//  Created by Ivan Klishevich on 13.08.2021.
//

import UIKit

enum CheckersColor: Int {
    case white = 0
    case black = 1
}

class Checkers: UIViewController{
    
    @IBOutlet weak var newGameBtn: UIButton!
    @IBOutlet weak var settingsBtn: UIButton!
    @IBOutlet weak var resultsBtn: UIButton!
    
//    @IBOutlet weak var timerSwitch: UISwitch!

    @IBOutlet weak var settingsView: UIView!
    @IBOutlet weak var resultsView: UIView!
    @IBOutlet weak var whoStepImage: UIImageView!
    @IBOutlet weak var whoStepView: UIView!
    @IBOutlet weak var whoStepLabel: UILabel!
    @IBOutlet weak var collectionTheme: CustomSettingsView!
    @IBOutlet weak var playersNames: CustomPlayersNameAlert!
    
    var chessboard: UIView!
    var frameChessboard: UIImageView!
    var defaultCell: UIView?
    var isLong = false
    var isFirstStep = true
    var resumeGame: Bool = true
    var whoStep: CheckersColor = .white
    var cellAndChecker: [CheckerInfo] = []
    var possibleSteps: [Int] = []
    var beatPositions: [[Int]] = []
    var beatSteps: [[Int]] = []
    var kingCheckers: [Int] = []
    var kingBeatPositions: [[Int]] = []
    var kingBeatSteps: [[Any]] = []
    var doubleStep: [Any] = [false, -1]
    
    var dynamicChecker: [[Int]] = []
    var dynamicKingChecker: [[Any]] = []
    
    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let ud = UserDefaults.standard
    
    var timer: CADisplayLink?
    var seconds: Int = 0
    var timerLabel: UILabel!
    
    let dateFormatter = DateFormatter()
    var dataDate: String = ""
    
    var theme: Theme = Theme()
    var themes: [Theme] = []
    var background: UIImageView?
    
    var players: [Player] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkSaveFile()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
