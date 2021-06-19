//
//  ViewController.swift
//  DZ_Lesson_3
//
//  Created by Ivan Klishevich on 18.06.2021.
//

import UIKit

typealias FIZ = (pushUps: Int, pullUps: Int, squats: Int)
typealias CodeTuple = (code: Int, message: String?, errorMessage: String?)
typealias MessageTuple = (message: String?, errorMessage: String?)
typealias Student = (name: String?, numberCar: Int?, mark: Int?)
typealias OptionalInt = (int1: Int?, int2: Int?, int3: Int?, int4: Int?, int5: Int?)

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        func Swap(firstTuple: inout FIZ, secondTuple: inout FIZ) {
            let extra: FIZ = firstTuple
            firstTuple = secondTuple
            secondTuple = extra
        }
        
        func Check(checkParam: String) -> String {
            return Int(checkParam) != nil ? checkParam : "nil" // усвоить тернарный оператор
        }
        
        func InfoStudent(student: Student) {
            let studentCar: String
            let studentKR: String
            
            if let car = student.numberCar {
                studentCar = "Yes"
            } else {
                studentCar = "No"
            }
            if let kr = student.mark {
                studentKR = "Yes"
            } else {
                studentKR = "No"
            }
            
            print("Info: Student - \(student.name ?? "___"), Have car - \(studentCar ?? "___"), Number of car - \(student.numberCar ?? 0), Presence on KR - \(studentKR ?? "___"), Mark on KR - \(student.mark ?? 0)")
        }
        
        func Task1() {
            print("=== Task 1 ===\n")
            print("Max fiz Vanya:\npush-ups: \(fizVanya.pushUps)\npull-ups: \(fizVanya.pullUps)\nsquats: \(fizVanya.squats)\n")
        }
        
        func Task2() {
            print("=== Task 2 ===\n")
            
            print("Max fiz Vanya:")
            print("index: \(fizVanya.0) && param: \(fizVanya.pushUps)")
            print("index: \(fizVanya.1) && param: \(fizVanya.pullUps)")
            print("index: \(fizVanya.2) && param: \(fizVanya.squats)\n")
        }
        
        func Task3() {
            print("=== Task 3 ===\n")
            
            Swap(firstTuple: &fizVanya, secondTuple: &fizFriend)
            print(fizVanya)
            print("\(fizFriend)\n")
        }
        
        func Task4(firstTuple: FIZ, secondTuple: FIZ) {
            print("=== Task 4 ===\n")
            
            let diffTuple: FIZ = (fizVanya.pushUps - fizFriend.pushUps, fizVanya.pullUps - fizFriend.pullUps, fizVanya.squats - fizFriend.squats)
            print("\(diffTuple)\n")
        }
        
        func Task5() {
            print("=== Task 5 ===\n")
            
            let str1 = "2"
            let str2 = "sd4"
            let str3 = "3"
            let str4 = "7hj"
            let str5 = "6"
            let str6 = "hqf"
            
            var summ = 0
            
            if let str1 = Int(str1) {
                summ += str1
            }
            if let str2 = Int(str2) {
                summ += str2
            }
            if Int(str3) != nil {
                summ += Int(str3)!
            }
            if Int(str4) != nil {
                summ += Int(str4)!
            }
            summ += Int(str5) ?? 0
            summ += Int(str6) ?? 0

            print("\(Check(checkParam: str1)) + \(Check(checkParam: str2)) + \(Check(checkParam: str3)) + \(Check(checkParam: str4)) + \(Check(checkParam: str5)) + \(Check(checkParam: str6))\n")
        }
        
        func Task6() {
            print("=== Task 6 ===\n")
            
            let codeTuple: CodeTuple = (Int.random(in: 175..<325), "1. Message", nil) // такой диапазон использовал для возможности показа else
            print("1. \(codeTuple.code)")
            
            if codeTuple.code >= 200 && codeTuple.code < 300 {
                print(codeTuple.message!)
            } else {
                print(codeTuple.message ?? "Error")
            }
            
            let messageTuple: MessageTuple = (nil, "2. Error")
            if let message = messageTuple.message {
                print(messageTuple.message!)
            } else {
                print(messageTuple.errorMessage!)
            }
            print()
        }
        
        func Task7() {
            print("=== Task 7 ===\n")
            
            let student1: Student
            let student2: Student
            let student3: Student
            let student4: Student
            let student5: Student
            
//            let student2car: String
//            let student3car: String
//            let student4car: String
//            let student5car: String
//
//            let student2KR: String
//            let student3KR: String
//            let student4KR: String
//            let student5KR: String
            
            student1 = ("Ivan", 1234, nil)
            student2 = ("Maksim", nil, 7)
            student3 = ("Pavel", 5678, nil)
            student4 = ("Nikita", nil, 8)
            student5 = ("Vlad", 3456, 9)
            
            InfoStudent(student: student1)
            InfoStudent(student: student2)
            InfoStudent(student: student3)
            InfoStudent(student: student4)
            InfoStudent(student: student5)
            print()
        }
        
        func Task8() {
            print("=== Task 8 ===\n")
            
            let optInt: OptionalInt = (1, nil, 3, nil, 5)
            var summBin = 0
            var summUnwrap = 0
            var summQ = 0
            
            if let number = optInt.int1 {
                summBin += optInt.int1!
            }
            if let number = optInt.int2 {
                summBin += optInt.int2!
            }
            if let number = optInt.int3 {
                summBin += optInt.int3!
            }
            if let number = optInt.int4 {
                summBin += optInt.int4!
            }
            if let number = optInt.int5 {
                summBin += optInt.int5!
            }
            
            if optInt.int1 != nil {
                summUnwrap += optInt.int1!
            }
            if optInt.int2 != nil {
                summUnwrap += optInt.int2!
            }
            if optInt.int3 != nil {
                summUnwrap += optInt.int3!
            }
            if optInt.int4 != nil {
                summUnwrap += optInt.int4!
            }
            if optInt.int5 != nil {
                summUnwrap += optInt.int5!
            }
            
            summQ += optInt.int1 ?? 0
            summQ += optInt.int2 ?? 0
            summQ += optInt.int3 ?? 0
            summQ += optInt.int4 ?? 0
            summQ += optInt.int5 ?? 0
            
            print("summ binding: \(summBin)\nsumm unwrap: \(summUnwrap)\nsumm ??: \(summQ)")
        }
        
        var fizVanya: FIZ = (50, 13, 70)
        var fizFriend: FIZ = (45, 15, 60)
        
        Task1()
        Task2()
        Task3()
        Task4(firstTuple: fizVanya, secondTuple: fizFriend)
        Task5()
        Task6()
        Task7()
        Task8()
        
        
        
        
        
        // Спросить про вывод через ?? в консоль с типами
        
        
//        Вопрос: Отличие -> Int(str2!) && Int(str2)!
//        Вопрос: что мы получаем в итоге после такой конструкции в let str1 - Int или Int? и как работатет
//        if let str1 = Int(str1!) {
//            summ += str1
//        }
//        if let str2 = Int(str2!) {
//            summ += str2
//        }
    }


}

