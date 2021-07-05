//
//  ViewController.swift
//  dz7
//
//  Created by Ivan Klishevich on 04.07.2021.
//

import UIKit

func task1() {
    let dancer = Dancer(name: "Pavel", surname: "Klishevich")
    let singer = Singer(name: "Nikita", surname: "Klishevich")
    let painter = Painter(name: "Ivan", surname: "Klishevich")
    
    let afisha = [dancer, singer, painter]
    
//        dancer.afisha(where: afisha)
    Artist.afisha(where: afisha)
    
    for value in afisha {
        value.presentation()
    }
}

func task2() {
    let plane = Plane(speed: 800, capacity: 300, costKm: 1)
    let ship = Ship(speed: 55.5, capacity: 200, costKm: 0.1)
    let helicopter = Helicopter(speed: 311, capacity: 10, costKm: 0.5)
    let car = Car(speed: 100, capacity: 20, costKm: 0.125)
    
    let transport = [plane, ship, helicopter, car]
    
    for value in transport {
        value.transportation(where: 300, and: 1000)
    }
}

func task3() {
    let human1 = Human(legs: 2)
    let human2 = Human(legs: 2)
    let crocodile1 = Crocodile(legs: 4)
    let crocodile2 = Crocodile(legs: 4)
    let monkey1 = Monkey(legs: 2)
    let monkey2 = Monkey(legs: 2)
    let dog1 = Dog(legs: 4)
    let dog2 = Dog(legs: 4)
    let giraffe1 = Giraffe(legs: 4)
    let giraffe2 = Giraffe(legs: 4)
    
    let masEssence = [human1, human2, crocodile1, crocodile2, monkey1, monkey2, dog1, dog2, giraffe1, giraffe2]
    
    var countFour = 0
    var countAnimals = 0
    var countEssence = 0
    
    for value in masEssence {
        if value is Essence { //поместил внутрь по причине, что если что-то не СУЩЕСТВО, то и ног или живым быть не может
            countEssence += 1
            
            if value.legs == 4 {
                countFour += 1
            }
            
            if value.essenceClass == "Animal" {
                countAnimals += 1
            }
        }
    }
    print("Count of Essence - \(countEssence)\nCount of Four - \(countFour)\nCount of Animals - \(countAnimals)")
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        task1()
        task2()
        task3()
        
    }

}

