//
//  Group.swift
//  DZ_Lesson_6
//
//  Created by Ivan Klishevich on 29.06.2021.
//

import Foundation

class Group {
    let numberGroup: Int
    var students: [Student]
    
    init(numberGroup: Int, students: [Student]) {
        self.numberGroup     = numberGroup
        self.students        = students
    }
    
//    init(numberGroup: Int, students: [Student] = []) {
//        self.numberGroup     = numberGroup
//        self.students        = students
//    }
    
    
//    var students: [Student] = []
//    init(numberGroup: Int) {
//        self.numberGroup = numberGroup
//    }
    
    func printGroupStudents() {
        print("Group number \(self.numberGroup)\n")
        for value in self.students {
            print("\(value.name) \(value.lastName) \(value.birthDate) \(value.avgMark)")
        }
    }
    
    func removeBadStudent(where mark: Float) {
//        for index in stride(from: self.students.endIndex - 1, through: self.students.startIndex, by: -1) {
//            if self.students[index].avgMark < mark {
//                self.students.remove(at: index)
//            }
//        }
        
        self.students = self.students.filter() { value in value.avgMark > mark }
        print()
        printGroupStudents()
    }
}
