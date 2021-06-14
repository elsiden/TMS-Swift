//
//  ViewController.swift
//  tms2.1
//
//  Created by Ivan Klishevich on 14.06.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
//        let myName:         String = "Ivan"
//        let age:            Int = 21
//        let weight:         Float = 70.5
//        let height:         Int = 188
//        let isIOSDeveloper: Bool = true
//        let sallary:        Int = 25
        
//        var a: Double = 32
//        print(a)
//        a = 42
//        print(a)
//        a = 42.5
//        print(a)

//        var a: Double = 7 / 2 // 3.5
//        var b = 7 / 2 // 3
//
//        var str1 = "45"
//        var str2 = "30"
//        var str3 = str1 + str2 // 4530
//        var str4 = Int(str1)! + Int(str2)!
//        print(str4)
//
//        let int_a: Int = 32
//        let double_a : Double = 35.6
//        let double_a = Double(int_a) // копия
//        let mul = Double(int_a) + double_a
//
//        let string_a = String(int_a)

        
        
//        print(myName, age, weight, height, isIOSDeveloper, sallary)
//        print(myName)
//        print(age)
//        print(weight)
//        print(height)
//        print(isIOSDeveloper)
//        print(sallary)
        
//        print("Name: \(myName)")
        
//        print("Int:  \(Int.max)")
//        print("Int:  \(Int.min)")
//        print()
//        print("UInt:  \(UInt.max)")
//        print("UInt:  \(UInt.min)")
//        print()
//        print("Int8:  \(Int8.max)")
//        print("Int8:  \(Int8.min)")
//        print()
//        print("Int64:  \(Int64.max)")
//        print("Int64:  \(Int64.min)")
        
//        ================ if
        
//        let a: Int = 30
//
//        if a > 30 {
//            print("a = \(a)")
//        } else {
//            print("a less than 30")
//        }
        
        
//        ================== тернарные операторы
        
        let name = "Ivan"
        var sallary = 20000
//
//        sallary = (name == "Ivan") ? (sallary + 5000) : (sallary + 2000)
//        (name == "Ivan") ? print("123") : print("456")
//
//        if name == "Ivan" {
//            sallary += 5000
//        } else {
//            sallary += 2000
//        }
//
//        print("Sallary: \(sallary)")
        
//        ================== switch
        
//        switch name {
//        case "Ivan":
//            sallary += 5000
//        case "Maria":
//            sallary += 2000
//        case "Andrey":
//            sallary += 10000
//        default:
//            break
//        }
        
        switch name {
        case "Ivan", "Pavel", "Nikita": // запятая это ||
            sallary += 5000
        case "Maria":
            sallary += 2000
        case "Andrey":
            sallary += 10000
        default:
            break
        }
        print(sallary)
        // 3000...6000
        // 3000..<6000
        
        
    }
}
