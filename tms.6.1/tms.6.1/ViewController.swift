//
//  ViewController.swift
//  tms.6.1
//
//  Created by Ivan Klishevich on 28.06.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        if activity.isAnimating
        
        
        
        let human: Human = Human(firstName: "Ivan",
                                  lastName: "Klishevich",
                                  surName: "Aleksandrovich",
                                  age: 21,
                                  weight: 70.5)
        
        print(human.firstName)
        print(human.lastName)
        
        
        let human3: Human = Human(firstName: "Pavel",
                                  lastName: "Klishevich",
                                  surName: "Aleksandrovich",
                                  age: 21,
                                  weight: 70.5)
        
//        human = human3 //запись ссылки human3 в human и удаление ссылки human
//
//        var tup1: (name: String, age: Int) = ("Ivan", 21) // работа с копиями, не оригиналами !!!
//        print(tup1)
//        var tup2 = tup1
//        tup2.name = "Vlad"
//        print(tup1)
//        print(tup2)
        
        
        
        let human2 = human // запись не копии а ссылки (оригинала) !!!
        human2.firstName = "Vlad"
        
        print(human.firstName)
        print(human.lastName)
        
        
        
//        Если анамирован - остановить и наоборот
//        1) функция нажатия на кнопку
//        2) проверка активности
//        3) анимируется - остановить и наоборот
//
    }
    @IBAction func buttonAction(_ sender: UIButton) {
        
        guard let text = textField.text, !text.isEmpty else {
            if activity.isAnimating {
                activity.stopAnimating()
            }
            print("error")
            return
        }
        
        view.backgroundColor = .orange
        
        print("text - \(text)")
        if !activity.isAnimating {
            activity.startAnimating()
        }
        
        
//        if let text = textField.text, !text.isEmpty { // развернулся опционал и поле не пустое
//            print("text - \(text)")
//            if !activity.isAnimating {
//                activity.startAnimating()
//            }
//        } else {
//            if activity.isAnimating {
//                activity.stopAnimating()
//            }
//            print("error")
//        }
        
        
        
        
//        if activity.isAnimating {
//            activity.stopAnimating()
//        } else {
//            activity.startAnimating()
//        }
    }
    
    
    

}

