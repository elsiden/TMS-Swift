//
//  Essence.swift
//  dz7
//
//  Created by Ivan Klishevich on 05.07.2021.
//

import Foundation

class Essence {
//    let essenceClass: String
//    let legs: Int
//
//    init(essenceClass: String, legs: Int) {
//        self.essenceClass = essenceClass
//        self.legs = legs
//    }
    
    var essenceClass: String {
        return "Unknown"
    }
    
    var essenceType: String {
        return "Essence"
    }
    
    let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
    
}
