//
//  Theme.swift
//  CheckersProject
//
//  Created by Ivan Klishevich on 21.08.2021.
//

import UIKit

class Theme: NSObject, NSCoding, NSSecureCoding {
    static var supportsSecureCoding: Bool = true
    
    let themeTitle: String
    let cellsTitle: String
    let lightCell: String
    let darkCell: String
    
    init(themeTitle: String = "darkWoodBg", cellsTitle: String = "woodCells", lightCell: String = "lightWoodCell", darkCell: String = "darkWoodCell") {
        self.themeTitle = themeTitle
        self.cellsTitle = cellsTitle
        self.lightCell = lightCell
        self.darkCell = darkCell
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(themeTitle, forKey: KeysUserDefaults.themeTitle.rawValue)
        coder.encode(cellsTitle, forKey: KeysUserDefaults.cellsTitle.rawValue)
        coder.encode(lightCell, forKey: KeysUserDefaults.lightCell.rawValue)
        coder.encode(darkCell, forKey: KeysUserDefaults.darkCell.rawValue)
    }

    required init?(coder: NSCoder) {
        themeTitle = (coder.decodeObject(forKey: KeysUserDefaults.themeTitle.rawValue) as? String) ?? "darkWoodBg"
        cellsTitle = (coder.decodeObject(forKey: KeysUserDefaults.cellsTitle.rawValue) as? String) ?? "woodCells"
        lightCell = (coder.decodeObject(forKey: KeysUserDefaults.lightCell.rawValue) as? String) ?? "lightWoodCell"
        darkCell = (coder.decodeObject(forKey: KeysUserDefaults.darkCell.rawValue) as? String) ?? "darkWoodCell"

    }
}
