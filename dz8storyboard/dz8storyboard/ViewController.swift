//
//  ViewController.swift
//  dz8storyboard
//
//  Created by Ivan Klishevich on 08.07.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonSum(_ sender: UIButton) {
        var summ = 0
        
        func calc(where num1: String?, and num2: String?) {
            if let num1 = Int(num1!) {
                summ += num1
                if let num2 = Int(num2!) {
                    summ += num2
                    label.text = "\(summ)"
                } else {
                    label.text = "Error"
                }
            } else {
                label.text = "Error"
            }
        }
        calc(where: textField1.text, and: textField2.text)
    }
    
}

