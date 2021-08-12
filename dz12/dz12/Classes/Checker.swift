//
//  File.swift
//  dz12
//
//  Created by Ivan Klishevich on 09.08.2021.
//

import UIKit

class Checker: NSObject, NSCoding, NSSecureCoding {
    static var supportsSecureCoding: Bool = true
    
    var cellTag: Int? = nil
    var checkerTag: Int? = nil
    
    override init() {
        super.init()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(checkerTag, forKey: KeysUserDefaults.checkerTag.rawValue)
        coder.encode(cellTag, forKey: KeysUserDefaults.cellTag.rawValue)
    }

    required init?(coder: NSCoder) {
        self.cellTag = coder.decodeObject(forKey: KeysUserDefaults.cellTag.rawValue) as? Int
        self.checkerTag = coder.decodeObject(forKey: KeysUserDefaults.checkerTag.rawValue) as? Int
    }
}
