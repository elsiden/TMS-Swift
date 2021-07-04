//
//  ManCar.swift
//  tms7
//
//  Created by Ivan Klishevich on 01.07.2021.
//

import Foundation

class ManCar: Car {
    var pricep: Pricep
    
    init(pricep: Pricep, engine: Engine, trans: Trans, weight: Double, color: String, type: String) {
        self.pricep = pricep // первым делом родное потом наследованное
        super.init(engine: engine, trans: trans, weight: weight, color: color, type: type)
    }
    
    func setEmptyPricep() {
        
    }
    
    override func go() {
        print("Class ManCar method go")
    }
}
