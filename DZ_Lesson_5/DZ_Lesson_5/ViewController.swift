//
//  ViewController.swift
//  DZ_Lesson_5
//
//  Created by Ivan Klishevich on 25.06.2021.
//

import UIKit
typealias MonthAndDays = (month: String, days: Int)

func task1() {
    print("=== Task 1 ===\n")
    
    let alphabet = "abcdefghijklmnopqrstuvwxyz"
    let char = "j"
    
    for (index, value) in alphabet.enumerated() {
        if String(value) == char {
            print("Character - \(value) on the \(index) index")
        }
    }
    
//        var index = 0
    
//        for value in alphabet {
//            if String(value) == char {
//                print("Character - \(value) on the \(index) index")
//            }
//            index += 1
//        }
}

func task2() {
    print("\n=== Task 2 ===\n")
    
    let masDaysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    var outDays = ""
    for value in masDaysInMonth {
        outDays += ("\(String(value)) ")
    }
    print("\(outDays)\n")
    
    let masNameOfMonth = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    for (index, value) in masDaysInMonth.enumerated() {
        print("In \(masNameOfMonth[index]) \(value) days")
    }
    
    print()
    
    let masMonthAndDays: [MonthAndDays] = [("January", 31), ("February", 28), ("March", 31), ("April", 30), ("May", 31), ("June", 30), ("July", 31), ("August", 31), ("September", 30), ("October", 31), ("November", 30), ("December", 31)]
    for (index, value) in masMonthAndDays.enumerated() {
        print("In \(masMonthAndDays[index].month) \(value.days) days")
    }
    
    print()
    
    var count = masMonthAndDays.count - 1
    for _ in masMonthAndDays {
        if count < 0 {
            break
        }
        print("In \(masMonthAndDays[count].month) \(masMonthAndDays[count].days) days")
        count -= 1
    }
    
    print()
    
    let yourMonth = "May"
    let yourDay = 6
    var days = 0
    
    for value in masMonthAndDays {
        if value.month == yourMonth {
            break
        }
        days += value.days
    }
    days += yourDay
    print(days)
    
}

func task3() {
    print("\n=== Task 3 ===\n")
    
    let alphabet = "abcdefghijklmnopqrstuvwxyz"
    var outAlphabet = ""
    var masAlphabet: [String] = []
    
    for value in alphabet {
        masAlphabet.insert(String(value), at: 0)
    }
    
    for value in masAlphabet { // для красивого вывода
        outAlphabet += "\(value) "
    }
    print(outAlphabet)
    
}

func task4() {
    print("\n=== Task 4 ===\n")
    
    let str = "fjgfgagdfgagfjagff...,874187461864182368jwehqgf,.,jgfjhagdsft.,.64832rgjhgfy862.,f8teuwfgtuyewgfygefugweufygugfjgfgagdfgagfjagff...,874187461864182368jwehqgf,.,jgfjhagdsft.,.64832rgjhgfy862.,f8teuwfgtuyewgfygefugweufygug"
    var countLetter = 0
    var countNumbers = 0
    var countChar = 0
    for value in str {
        switch value {
        case "a"..."z":
            countLetter += 1
        case "!", ":", ".", ";", "?", ",":
            countChar += 1
        case "0"..."9":
            countNumbers += 1
        default:
            break
        }
    }
    print("Letters - \(countLetter), numbers - \(countNumbers), chars - \(countChar)")
}

func task5() {
    print("\n=== Task 5 ===\n")
    
//    var masTask5 = [1, 2, 3, 4, 5]
//    masTask5 = reverseMas(where: masTask5)
//    print(masTask5)
    
    let numbers = "12345"
    print(transStringToMas(where: numbers))
}

func reverseMas(where mas: [Int]) -> [Int] {
    return mas.reversed()
}

func transStringToMas(where string: String) -> [Int] {
    var mas: [Int] = []
    
    for value in string {
//        mas.append(Int(value))
//        mas.insert(String(value), at: 0)
    }
//    reverseMas(where: Int(mas)) // вопрос
//    return mas.reversed()
//    return mas
    return reverseMas(where: mas)
}

func task6() {
    print("\n=== Task 6 ===\n")
    
    var str = "Hello, 9 7 1"
    print(changeSymbols(where: &str))
}

func changeSymbols(where str: inout String) -> String {
    var str1 = ""
    for value in str {
        switch value.lowercased() {
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z":
            str1 += value.lowercased()
        case "a", "e", "i", "o", "u", "y":
            str1 += value.uppercased()
        case "!", ":", ".", ";", "?", ",":
            break
        case "1":
            str1 += "one"
        case "2":
            str1 += "two"
        case "3":
            str1 += "three"
        case "4":
            str1 += "four"
        case "5":
            str1 += "five"
        case "6":
            str1 += "six"
        case "7":
            str1 += "seven"
        case "8":
            str1 += "eight"
        case "9":
            str1 += "nine"
        case "0":
            str1 += "zero"
        case " ":
            str1 += " "
        default:
            break
        }
    }
    str = str1
    return str
}

func task7() {
    print("\n=== Task 7 ===\n")
    
    let masNumbers = [2, 3, 1, 6, 7, 8, 9, 4, 0, 5]
    print(findMasMAx(where: masNumbers))
    
}

func findMasMAx(where mas: [Int]) -> Int {
    var max = mas[0]
    for value in mas {
        if value > max {
            max = value
        }
    }
    return max
}

func task8() {
    print("\n=== Task 8 ===\n")
    
    let masNumbers = [2, 3, 1, 6, 7, 8, 9, 4, 0, 5]
    print(evenNotEven(where: masNumbers))
}

func evenNotEven(where mas: [Int]) -> [Bool] {
    var masBool: [Bool] = []
    for value in mas {
        if value % 2 == 0 {
            masBool.append(true)
        } else {
            masBool.append(false)
        }
    }
    return masBool
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        
        
        task1()
        task2()
        task3()
        task4()
        task5()
        task51()
        task6()
        task7()
        task8()
        
        
        func task51() {
            print("\n=== Task 5.1 ===\n")
            
        //    var masTask5 = [1, 2, 3, 4, 5]
        //    masTask5 = reverseMas(where: masTask5)
        //    print(masTask5)
            
            let numbers = "12345"
            print(transStringToMas(where: numbers))
        }

        func reverseMas(where mas: [Int]) -> [Int] {
            return mas.reversed()
        }

        func transStringToMas(where string: String) -> [String] {
            var mas: [String] = []
            
            for value in string {
                mas.insert(String(value), at: 0)
            }
            return mas
        }
        
        
        
        
    }


}

