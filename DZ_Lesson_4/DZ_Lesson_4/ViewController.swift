//
//  ViewController.swift
//  DZ_Lesson_4
//
//  Created by Ivan Klishevich on 22.06.2021.
//

import UIKit
typealias WorkerInfo = (name: String, age: Int, sallary: Float)

func calcAndPrintSallary(where worker: inout WorkerInfo) { // использую inout так как по заданию нужно именно навсегда изменить зарплату, поэтому работаем с оригиналами
    switch worker.age {
    case 18...30:
        worker.sallary *= 1.5
    case 31...40:
        worker.sallary *= 2
    default:
        worker.sallary *= 3
    }
    
    print("Worker name: \(worker.name), age: \(worker.age), sallary: \(worker.sallary)")
}

func printAverage(where a: Double, and b: Double, and c: Double) {
    var avg = String(format: "%.5f", (a + b + c) / 3)      // калькулятор получается не супер точный, но для значений до 5 знаков после запятой включительно подходит
    if avg.contains("0") {                                 // необходимо оптимизировать
        avg = String(format: "%g", (a + b + c) / 3)        // почему не работает при подстановке avg
    }
    
    print(avg)
}

func calcAndPrintInfoCredit(where n: Float, and y: Int, and p: Float) { // уместно ли писать много and
    let pow = pow(p + 1, Float(y))
    let m: Float = (n * p * pow) / (12 * (pow - 1))
    let s: Float = (m * 12) * Float(y)
    print("Summ of credit: \(n)\nPeriod (year): \(y)\nPercent: \(p)\nMonthly: \(m)\nTotal summ: \(s)")
}

func findMinMax(where a: Int, and b: Int, and c: Int) -> (min: Int, max: Int) {
    var min = (a + b - abs(a - b)) / 2
    min = (min + c - abs(min - c)) / 2
    var max = (a + b + abs(a - b)) / 2
    max = (max + c + abs(max - c)) / 2
    return (min, max)
}

func swap(where num1: inout Int, and num2: inout Int) {
    let c = num1
    num1 = num2
    num2 = c
}

func swap(where num1: inout String, and num2: inout String) {
    let c = num1
    num1 = num2
    num2 = c
}

func swap(where num1: inout Double, and num2: inout Double) {
    let c = num1
    num1 = num2
    num2 = c
}

func mealInfo(where breakfast: Int, and ostNorm: inout Int) {
    ostNorm -= breakfast
    let protein = 0.4
    let vitA = 0.25
    let vitC = 0.35
    
    let ostProt = String(format: "%g", Double(ostNorm) * protein)
    let ostA = String(format: "%g", Double(ostNorm) * vitA)
    let ostC = String(format: "%g", Double(ostNorm) * vitC)
    
    print("Ost protein: \(ostProt), ost vitA: \(ostA), ost vitC: \(ostC)")
   
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var workerIvan: WorkerInfo = ("Ivan", 21, 50000.5)
        var workerVlad: WorkerInfo = ("Vlad", 35, 5000.75)
        var workerMaksim: WorkerInfo = ("Maksim", 42, 30000.9)

        print("=== Task 1 ===\n")

        calcAndPrintSallary(where: &workerIvan)
        calcAndPrintSallary(where: &workerVlad)
        calcAndPrintSallary(where: &workerMaksim)

        print("\n=== Task 2 ===\n")

        printAverage(where: 1, and: 2.5, and: 0.5)

        print("\n=== Task 3 ===\n")

        let n: Float = 1000000
        let y: Int = 10
        let p: Float = 12
        calcAndPrintInfoCredit(where: n, and: y, and: p / 100)
        
        print("\n=== Task 1 Dop ===\n")

        let a = 20
        let b = 25
        let c = 15
        let minMax = findMinMax(where: a, and: b, and: c)
        print(minMax)

        print("\n=== Task 2 Dop ===\n")

        var a1 = 10
        var b1 = 15
        swap(where: &a1, and: &b1)
        print(a1, b1)

        print("\n=== Task 3 Dop ===\n")

        var a2 = "12"
        var b2 = "34"
        swap(where: &a2, and: &b2)
        print(a2, b2)

        var a3 = 12.2
        var b3 = 9.2
        swap(where: &a3, and: &b3)
        print(a3, b3)
        
        print("\n=== Task 4 Dop ===\n")
        
        let breakfast = 2
        var ostNorm = 10
        mealInfo(where: breakfast, and: &ostNorm)
        mealInfo(where: breakfast, and: &ostNorm)
        
        
        
        
    }


}

