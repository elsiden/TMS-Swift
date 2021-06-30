//
//  ViewController.swift
//  DZ_Lesson_6
//
//  Created by Ivan Klishevich on 29.06.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let student1 = Student(name: "Ivan", lastName: "Klishevich", birthDate: "06.05.2000", avgMark: 8.5)
        let student2 = Student(name: "Vlad", lastName: "Poleschuk", birthDate: "08.05.1997", avgMark: 9.1)
        let student3 = Student(name: "Pavel", lastName: "Klishevich", birthDate: "10.03.2004", avgMark: 8.4)
        let student4 = Student(name: "Nikita", lastName: "Klishevich", birthDate: "11.06.2005", avgMark: 8.4)
        let student5 = Student(name: "Artur", lastName: "Utkin", birthDate: "15.04.2001", avgMark: 7.2)
        let student6 = Student(name: "Vadim", lastName: "Berdnikov", birthDate: "14.08.2002", avgMark: 7.7)
        
        let group1 = Group(numberGroup: 1, students: [student1, student2, student3, student4, student5, student6])
        
        group1.printGroupStudents()
        group1.removeBadStudent(where: 8.0)

    }


}

