//
//  Engine.swift
//  tms7
//
//  Created by Ivan Klishevich on 01.07.2021.
//

import Foundation

class Engine {
    let v: Double
    let weight: Double
    let maxKrut: Double
    let power: Double
    let type: String
    
    init(v: Double, weight: Double, maxKrut: Double, power: Double, type: String) {
        self.v = v
        self.weight = weight
        self.maxKrut = maxKrut
        self.power = power
        self.type = type
    }
}
