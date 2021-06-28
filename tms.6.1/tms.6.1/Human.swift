//
//  Human.swift
//  tms.6.1
//
//  Created by Ivan Klishevich on 28.06.2021.
//

import Foundation

class Human {
    var firstName: String
    let lastName: String
    let surName: String?
    let age: Int
    let weight: Float
    
    init(firstName: String, lastName: String, surName: String? = nil, age: Int, weight: Float) {
        self.firstName = firstName
        self.lastName = lastName
        self.surName = surName
        self.age = age
        self.weight = weight
    }
    
    func test(a: Int = 2, b: Int = 4) {
        
    }
    
    func sayHello() {
        
        func sayOkey() {
            print("Okey!")
        }
        
        sayOkey() // ЭТО ФУНКЦИЯ ДОСТУПНА ТОЛЬКО ИЗ ЭТОГО МЕТОДА
        print("Hello! My name is \(self.firstName)")
//        test() // берется по умолчанию
//        test(a: 10, b: 8) // устанавливаются указанные
    }
    
    func prettyPrinted() {
        print("My name is \(firstName) \(lastName) \(surName ?? "")")
    }
}
