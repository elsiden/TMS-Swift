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
    var playerChecker: Int
    
    init(playerName: String = "", playerChecker: Int = 0) {
        self.playerName = playerName
        self.playerChecker = playerChecker
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(playerName, forKey: KeysUserDefaults.playerName.rawValue)
        coder.encode(playerChecker, forKey: KeysUserDefaults.playerChecker.rawValue)
    }
    
    required init?(coder: NSCoder) {
        self.playerName = (coder.decodeObject(forKey: KeysUserDefaults.playerName.rawValue) as? String) ?? ""
        self.playerChecker = (coder.decodeObject(forKey: KeysUserDefaults.playerChecker.rawValue) as? Int) ?? 0
    }
}
