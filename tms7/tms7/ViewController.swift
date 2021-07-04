//
//  ViewController.swift
//  tms7
//
//  Created by Ivan Klishevich on 01.07.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let engine = Engine(v: 2.0, weight : 360, maxKrut: 700, power: 500, type: "Diesel")
        let trans = Trans(type: "Robot", count: 6)
        
//        let car = Car(engine: engine, trans: trans, weight: 2500, color: "Red", type: "coope")
        
        let pricep = Pricep(maxWeight: 5000, height: 3, countWhiless: 16)
        let manCar: ManCar = ManCar(pricep: pricep, engine: engine, trans: trans, weight: 10000, color: "red", type: "Cargo")
        
//        manCar.go()
//        (manCar as TestClass).go() // вызов конкретной функции из указанного класса
        
//        let mas: [Car] = [manCar] // разные типы но положить можно из-за наследования
        
        
        
        
//        let array: [Any] = [1, "12345", true, 23.4]
        
//        for value in array {
//            if let value = value as? Int {
//                
//            }
//            if let value = value as? String {
//                
//            }
//        }
        
        
        
        let bmw: BMWCar = BMWCar(engine: engine, trans: trans, weight: 10000, color: "red", type: "Cargo")
        let mers: MersCar = MersCar(engine: engine, trans: trans, weight: 10000, color: "red", type: "Cargo")
        let lada: LadaCar = LadaCar(engine: engine, trans: trans, weight: 10000, color: "red", type: "Cargo")
        let mas: [Car] = [manCar, bmw, mers, lada]
        
        for car in mas {
            if let value = car as? BMWCar {
                //
            }
            if let value = car as? MersCar {
                //
            }
            
            if car.isKind(of: BMWCar.self) { // через наследование от NSObject
                
            }
            car.go()
        }
        
    }


}

