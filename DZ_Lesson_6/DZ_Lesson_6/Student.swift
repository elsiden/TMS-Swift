//
//  Student.swift
//  DZ_Lesson_6
//
//  Created by Ivan Klishevich on 29.06.2021.
//

import Foundation

class Student {
    let name: String
    let lastName: String
    let birthDate: String
    let avgMark: Float
    
    init(name: String, lastName: String, birthDate: String, avgMark: Float) {
        self.name        = name
        self.lastName    = lastName
        self.birthDate   = birthDate
        self.avgMark     = avgMark
    }
}
