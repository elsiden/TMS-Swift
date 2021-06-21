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
        
        func swap(firstTuple: inout FIZ, secondTuple: inout FIZ) {
            let extra: FIZ = firstTuple
            firstTuple = secondTuple
            secondTuple = extra
        }
        
        func check(checkParam: String) -> String {
            return Int(checkParam) != nil ? checkParam : "nil"
        }
        
        func infoStudent(student: Student) {
            let studentCar: String
            let studentKR: String
            
            if let _ = student.numberCar {
                studentCar = "Yes"
            } else {
                studentCar = "No"
            }
            if let _ = student.mark {
                studentKR = "Yes"
            } else {
                studentKR = "No"
            }
            
            print("Info: Student - \(student.name ?? "___"), Have car - \(studentCar ?? "___"), Number of car - \(student.numberCar ?? 0), Presence on KR - \(studentKR ?? "___"), Mark on KR - \(student.mark ?? 0)")
        }
        
        func task1() {
            print("=== Task 1 ===\n")
            print("Max fiz Vanya:\npush-ups: \(fizVanya.pushUps)\npull-ups: \(fizVanya.pullUps)\nsquats: \(fizVanya.squats)\n")
        }
        
        func task2() {
            print("=== Task 2 ===\n")
            
            print("Max fiz Vanya:")
            print("index: \(fizVanya.0) && param: \(fizVanya.pushUps)")
            print("index: \(fizVanya.1) && param: \(fizVanya.pullUps)")
            print("index: \(fizVanya.2) && param: \(fizVanya.squats)\n")
        }
        
        func task3() {
            print("=== Task 3 ===\n")
            
            swap(firstTuple: &fizVanya, secondTuple: &fizFriend)
            print(fizVanya)
            print("\(fizFriend)\n")
        }
        
        func task4(firstTuple: FIZ, secondTuple: FIZ) {
            print("=== Task 4 ===\n")
            
            let diffTuple: FIZ = (fizVanya.pushUps - fizFriend.pushUps, fizVanya.pullUps - fizFriend.pullUps, fizVanya.squats - fizFriend.squats)
            print("\(diffTuple)\n")
        }
        
        func task5() {
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

            print("\(check(checkParam: str1)) + \(check(checkParam: str2)) + \(check(checkParam: str3)) + \(check(checkParam: str4)) + \(check(checkParam: str5)) + \(check(checkParam: str6))\n")
        }
        
        func task6() {
            print("=== Task 6 ===\n")
            
            let codeTuple: CodeTuple = (Int.random(in: 175..<325), "1. Message", nil) // такой диапазон использовал для возможности показа else
            print("1. \(codeTuple.code)")
            
            if codeTuple.code >= 200 && codeTuple.code < 300 {
                print(codeTuple.message ?? "nil")
            } else {
                print(codeTuple.message ?? "Error")
            }
            
            let messageTuple: MessageTuple = (nil, "2. Error")
            if let message = messageTuple.message {
                print(message)
            } else {
                print(messageTuple.errorMessage!)
            }
            print()
        }
        
        func task7() {
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
            
            infoStudent(student: student1)
            infoStudent(student: student2)
            infoStudent(student: student3)
            infoStudent(student: student4)
            infoStudent(student: student5)
            print()
        }
        
        func task8() {
            print("=== Task 8 ===\n")
            
            let optInt: OptionalInt = (1, nil, 3, nil, 5)
            var summBin = 0
            var summUnwrap = 0
            var summQ = 0
            
            if let number = optInt.int1 {
                summBin += number
            }
            if let number = optInt.int2 {
                summBin += number
            }
            if let number = optInt.int3 {
                summBin += number
            }
            if let number = optInt.int4 {
                summBin += number
            }
            if let number = optInt.int5 {
                summBin += number
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
        
        task1()
        task2()
        task3()
        task4(firstTuple: fizVanya, secondTuple: fizFriend)
        task5()
        task6()
        task7()
        task8()
        
        
        
        
        
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

