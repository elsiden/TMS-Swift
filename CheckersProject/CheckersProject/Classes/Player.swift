//
//  Player.swift
//  CheckersProject
//
//  Created by Ivan Klishevich on 06.09.2021.
//

import UIKit

class Player: NSObject, NSCoding, NSSecureCoding {
    static var supportsSecureCoding: Bool = true
    
    var playerName: String
    var playerStep: Int
    
    init(playerName: String = "", playerStep: Int = 0) {
        self.playerName = playerName
        self.playerStep = playerStep
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(playerName, forKey: KeysUserDefaults.playerName.rawValue)
        coder.encode(playerStep, forKey: KeysUserDefaults.playerStep.rawValue)
    }
    
    required init?(coder: NSCoder) {
        self.playerName = (coder.decodeObject(forKey: KeysUserDefaults.playerName.rawValue) as? String) ?? ""
        self.playerStep = (coder.decodeObject(forKey: KeysUserDefaults.playerStep.rawValue) as? Int) ?? 0
    }
}
