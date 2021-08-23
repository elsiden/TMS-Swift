//
//  Human.swift
//  tms17.1
//
//  Created by Ivan Klishevich on 08.08.2021.
//

import UIKit

class Human: NSObject, NSCoding, NSSecureCoding {
    static var supportsSecureCoding: Bool = true
    
    var name: String? = nil
    var gender: Gender? = nil
    
    override init() {
        super.init()
    }
    
    func encode(with coder: NSCoder) { // кодировка
        coder.encode(name, forKey: "name")
        coder.encode(gender?.rawValue, forKey: "gender")
    }
    
    required init?(coder: NSCoder) { // декодировка
        self.name = coder.decodeObject(forKey: "name") as? String
        
        if let genderValue = coder.decodeObject(forKey: "gender") as? Int,
           let gender = Gender(rawValue: genderValue) {
            self.gender = gender
        }
    }
}
