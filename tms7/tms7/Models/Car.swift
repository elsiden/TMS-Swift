//
//  Car.swift
//  tms7
//
//  Created by Ivan Klishevich on 01.07.2021.
//

import Foundation

class Car: TestClass {
    var engine: Engine
    let trans: Trans
    let weight: Double
    let color: String
    let type: String
    
    init(engine: Engine, trans: Trans, weight: Double, color: String, type: String) {
        self.engine = engine
        self.trans = trans
        self.weight = weight
        self.color = color
        self.type = type
    }
    
    override func go() {
        print("Class car method go")
    }
    
    func clacson() {
        
    }
}

