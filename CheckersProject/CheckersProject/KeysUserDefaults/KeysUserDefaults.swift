//
//  KeysUserDefaults.swift
//  CheckersProject
//
//  Created by Ivan Klishevich on 15.08.2021.
//

import UIKit

enum KeysUserDefaults: String {
    case timerSec = "timerSec_"
    case isTimerOn = "isTimerNo_"
    
    case startGameDate = "startGameDate_"
    
    case whoStep = "whoStep_"
    
    case saveBoard = "saveBoard_"
    case cellTag = "cellTag_"
    case checkerTag = "checkerTag_"
    
    case theme = "theme_"
    case themeTitle = "themeTitle_"
    case cellsTitle = "cellsTitle_"
    case lightCell = "lightCell_"
    case darkCell = "darkCell_"
    
    case playerName = "playerName_"
    case playerChecker = "playerChecker_"
    case players = "players_"
}
