//
//  ViewController.swift
//  DZ_Lesson_2
//
//  Created by Ivan Klishevich on 14.06.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // ================== task 1
        print("===== Task 1 =====\n")
        
        func decimal(x: Float) -> Int {
//            var i = x
//            while i > 1 {
//                i = i - 1
//            }
//            return Int(i*10)
            return Int(round((x - Float(Int(x))) * 10))
        }
        
        let num1: Float = 3.4
        let num2: Float = 7.3
        let num3: Float = 6.2
        let num4: Float = 4.1
        
        let sumFull = Int(num1) + Int(num2) + Int(num3) + Int(num4)
        let multFull = Int(num1) * Int(num2) * Int(num3) * Int(num4)
        let sumDec = decimal(x: num1) + decimal(x: num2) + decimal(x: num3) + decimal(x: num4)
        let multDec = decimal(x: num1) * decimal(x: num2) * decimal(x: num3) * decimal(x: num4)
        
        print("SumFull: \(sumFull)")
        print("MultFull: \(multFull)")
        print("SumDec: \(sumDec)")
        print("MultDec: \(multDec)")
        
        // ================== task 2
        print("\n===== Task 2 =====\n")
        
        let num5 = 25
        
        if num5 % 2 == 0 {
            print("Number \(num5) is even")
        } else {
            print("Number \(num5) is not even")
        }
        
        // ================== test
//        print("\n===== Test =====\n")
//
//        var numTest: Float = 4.1
//        var numTest2 = round(10 * numTest) / 10
//        var numTest3 = Int(round((numTest - Float(Int(numTest))) * 10))
//        print(numTest, numTest2, numTest3)
        
    }


}

