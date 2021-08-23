//
//  CheckerInfo.swift
//  CheckersProject
//
//  Created by Ivan Klishevich on 15.08.2021.
//

import UIKit

class CheckerInfo: NSObject, NSCoding, NSSecureCoding {
    static var supportsSecureCoding: Bool = true
    
    var cellTag: Int? = nil
    var checkerTag: Int? = nil
    
    override init() {
        super.init()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(cellTag, forKey: KeysUserDefaults.cellTag.rawValue)
        coder.encode(checkerTag, forKey: KeysUserDefaults.checkerTag.rawValue)
    }
    
    required init?(coder: NSCoder) {
        self.cellTag = coder.decodeObject(forKey: KeysUserDefaults.cellTag.rawValue) as? Int
        self.checkerTag = coder.decodeObject(forKey: KeysUserDefaults.checkerTag.rawValue) as? Int
        
//        if let checkerTagValue = coder.decodeObject(forKey: KeysUserDefaults.checkerTag.rawValue) as? Int,
//           let checkerTag = CheckersStep(rawValue: checkerTagValue) {
//            self.checkerTag = checkerTag
//        }
    }
}
