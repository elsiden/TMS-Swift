//
//  ViewController.swift
//  tms.5.1
//
//  Created by Ivan Klishevich on 24.06.2021.
//

import UIKit

func text() -> Int {
    return 5
}

func aver(a: Int, b: Int, c: Int) -> Double {
    let averValue = Double((a + b + c) / 3)
    print(averValue)
    return averValue
}

func testAs() -> Any {
    return 5
}



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let a: Int = 5
        
        let mas: [Int] = [1, 5, 7, 4, 2, 6, 3, 10, 8, 9]
        let mas2: [Int] = Array(repeating: 5, count: 10) // какое число сколько раз повторить
        let mas3 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] // без типа
        let mas4: [Int?] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, nil, 12, nil]
        let mas5: [Int] = []
        
//        print(mas[0])
//
//        print(mas[15]) // ошибка, за границу допустимых
//        print("count of elements in mas: \(mas.count)")
//
//        if mas.count > 10 { // count дает реальное число элементов в массиве значит 10 справа это 11 в массиве
//            print(mas[10])
//        }
//
//        for value in 0..<5 { // ... включая - ..< не включая
//            if value == 4 {
//                print("Hello")
//            }
//            print("iter number - \(value)")
//
//        }
        
        
//        var count = 0
//        while count < 50 {
//            print("Hello - \(count + 1)")
//            count += 1
//        }
        
//        print("INDEX")
//        var summ = 0
//        for value in 0..<mas.count {
//            summ += mas[value]
//        }
        
//        print("for value in mas")
//        var summ1 = 0
//        for value in mas {
//            summ1 += value
//        }
//        print(summ1)
        
//        print("For Each")
//        mas.forEach { (value) in
//            print(value)
//        }
//
        
        
//        print("enumerated")
//        for (index, value) in mas.enumerated() {
//            print("index - \(index), value - \(value)")
//        }
//
//        print("for each enumerated")
//        mas.enumerated().forEach { value in
//            print("offset - \(value.offset), value - \(value.element)")
//        }
        
//        for value in mas {
//            print("value break - \(value)")
//            if value == 3 {
//                break
//            }
//        }
//
//        for value in mas {
//            if value == 3 {
//                continue
//            }
//            print("value - \(value)")
//        }
        
//        var mas6: [Int] = []
//        print(mas6)
//        mas6.append(2)
//        mas6.append(contentsOf: mas) // добавление массива в массив
//        mas6.insert(101, at: 2)
//        mas6.remove(at: 0)
//        print(mas6.firstIndex(of: 3))
//        print(mas6)
        
//        print(text())
        
        let averValue = aver(a: 2, b: 3, c: 5)
        print(averValue)
        
        
        
        let anyMas: [Any] = [56, 34.5, "adas", "a", true] // любые типы в массиве кроме nil
        print(anyMas)
        
        let anyMas1: [Any?] = [56, 34.5, "adas", "a", true, nil] // любые типы в массиве
        print(anyMas1)
        
        for value in anyMas {
            if value is String {
                print("value is String = \(value)")
            }
//            ...
        }
        
        for value in anyMas1 {
            if value == nil {
                continue
            }
            if value is String {
                print("value is String = \(value ?? "___")")
            }
//            ...
        }
        
        var name = "Ivan"
        
        name.append("Klishevich")
//        name.startIndex
//        name.endIndex
        let index123 = name.index(before: name.endIndex)
        name[index123]
        
        
        var count = -1
        for value in name {
            count += 1
            if count == 2 {
                print(value)
            } else {
                continue
            }
        }
        
        
        func getCharacter(from string: String, at index: Int) -> String? {
            guard string.count > index else { return nil }
            for (indexString, value) in name.enumerated() {
                if indexString == index {
                    return String(value)
                }
            }
            
            return nil
        }
        
        
        
        
        
        
        
    }


}

