//
//  ViewController.swift
//  tms.3.1
//
//  Created by Ivan Klishevich on 17.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    typealias MyTypeName = (name: String, age: Int, isIOSDev: Bool, weight: Float)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let a: Int? = 1
//        let b: Float? = nil
//        let c: Double? = nil
        
//        let a: Int? = 123
//        let b: Int? = 50
//        let c: Int? = nil
//        let c: Int? = 5
//        var d: Int? = 20
//        let e: Int? // если не указать то будет nil
//        let e: Int? = nil
        
//============ первый вариант проверки опцианала ============
//        var summ = 0
//        if a != nil {
//            summ += a!
//        }
//        if b != nil {
//            summ += b!
//        }
//        if c != nil {
//            summ += c!
//        }
//        if d != nil {
//            summ += d!
//        }
//        if e != nil {
//            summ += e!
//        }
//        print("Summ: \(summ)")
        
//============ второй вариант проверки опционала ============
//        var summ = 0
//        summ += (a ?? 0)
//        summ += (b ?? 0)
//        summ += (c ?? 0)
//        summ += (d ?? 0)
//        summ += (e ?? 0)
//        print("summ: \(summ)")


        
        
//        var name: String = "Ivan"
//        var family: String = "Klishevich"
//        var otch: String? = nil //"Aleksandrovich"
//
//        print("Hello, \(name) \(family) \(otch!)") // без ! будет Optional(Aleksandrovich)
//        print("Hello, \(name) \(family) \(otch ?? "")") // Если значение nil, то ничего не вставится, если не nil, то подставится нужное. Учитывать пробел появляющийся без подстановки
        
        
//============ третий вариант проверки опционала ============
        
//        if otch != nil {
//            print(otch!)
//        }
//
//        if let nonOptOtch = otch { // если otch != nil
//            print(nonOptOtch) // при попадании делает String распаршенный
//        } else {
//            print("otch - nil")
//        }
//
//        if let otch = otch { // аналогично предыдущему и удобнее
//            print(otch)
//        }
        
//        if otch != nil {
//            let nonOptOtch = otch! //аналогично ПРЕД ПРЕДыдущему !НО ХУЖЕ!
//        }
        
//        if otch != nil {
//            let otch = otch!
//        }
        
//        ============================
        
//        let str1: String = "53"
//        let str2: String = "asdfghjkl"
//        let str3: String = "76"
//
//        let summString = (Int(str1) ?? 0) + (Int(str2) ?? 0) + (Int(str3) ?? 0)
        
//        !!!!!!!!!!!!
//        Int(Double) -> Int
//        Int(String) -> Int?
        
        
//        ============================ TUPLE - КОРТЕЖИ
        
//        Int, Float, Bool, String, Int? ...
        
//        let testTuple: (Int, String, Bool) = (14, "string 1", true)
        
//        let name: String = "Ivan"
//        let age: Int = 21
//        let isIOSDev: Bool = true
//        let weight: Float = 71.0
        
        let human: (String, Int, Bool, Float) = ("Ivan", 21, true, 71.0)
        print("\(human)\n")

        print(human.0)
        print(human.1)
        print(human.2)
        print("\(human.3)\n")
        
//        let name: String = human.0
//        let age: Int = human.1
//        let isIOSDev: Bool = human.2
//        let weight: Float = human.3
        
//        let (name, age, isIOSDev, weight) = human // не кортеж
//        print(name)
//        print(age)
//        print(isIOSDev)
//        print(weight)
        
//        let (name, _, _, weight) = human // подчеркивание если значения не нужны
        
//        if value != nil {
//
//        }
        
//        if let _ = value { // редко используется, просто разновидность
//
//        }
        
        
//        let man: (name: String, age: Int, isIOSDev: Bool, weight: Float) = ("Ivan", 21, true, 71.0) // обозначение имен для удобства при вызове
//        print(man.name)
        
//        let man = (name: "Ivan", age: 21, isIOSDEv: true, weight: 71.0)
//        print(man.age)
        
        
        
        let tupleAlias: MyTypeName = ("Ivan", 21, true, 71.0)
        print(tupleAlias.age)
        
        
    }


}

