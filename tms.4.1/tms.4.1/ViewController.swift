//
//  ViewController.swift
//  tms.4.1
//
//  Created by Ivan Klishevich on 21.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    func printName() {
        print("Hello")
    }
    
    func mull() {
        print(90 * 100000)
    }
    
    func summTwoDigits(where a: Int, and b: Int?) {
        
    }
    
    func summFunc(a: String?, b: Int?) { //одинаковое имя
        var summ = 0
        
        if a != nil {
            if Int(a!) != nil {
                summ = Int(a!)!
            }
        }
        
        if b != nil {
            summ += b!
        }
        
        print(summ)
    }
    
    func summFunc(_ a: Int, b: String, c: Double, e: Bool) { //одинаковое имя
        
    }
    
    func printInfoCar(numberOfMachine: Int?) {
        if let numberOfMachine = numberOfMachine {
            print("student has car number: \(numberOfMachine)")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        var a: String? = "iugdew13"
        var b: Int? = 30
        
        var summ = 0
        
        
        let name1 = "Ivan"
        let name2 = "Olga"
        let name3 = "Andrey"
        let name4 = "Pavel"
        let name5 = "Nikita"
        
        print(name1)
        print(name2)
        print(name3)
        print(name4)
        print(name5)
        printName()
        summFunc(a: a, b: b)
        summFunc(a: a, b: b)
//        summTwoDigits(where: <#T##Int#>, and: <#T##Int?#>)
        
        
        
        
        
        
        
    }


}

