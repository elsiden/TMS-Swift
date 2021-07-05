//
//  Dog.swift
//  dz7
//
//  Created by Ivan Klishevich on 05.07.2021.
//

import Foundation

class Dog: Essence {
//    let essenceClass: String = "Dog"
//    let legs: Int
//
//    init(legs: Int) {
//        self.legs = legs
//    }
    
    override var essenceClass: String {
        return "Animal"
    }
    
    override var essenceType: String {
        return "Dog"
    }
}
