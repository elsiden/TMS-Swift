//
//  ViewController2.swift
//  dz9pin
//
//  Created by Ivan Klishevich on 13.07.2021.
//

import UIKit

class ViewController2: UIViewController, UITextFieldDelegate {
    
    let textField1VC2 = UITextField(frame: CGRect(x: 100, y: 200, width: 200, height: 40))
    let textField2VC2 = UITextField(frame: CGRect(x: 100, y: 250, width: 200, height: 40))
    
    var name: String = ""
    
    weak var delegateVC2: ViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .gray
        
        let buttonVC2 = UIButton(frame: CGRect(x: 140, y: 350, width: 120, height: 40))
        buttonVC2.setTitle("Back", for: .normal)
        buttonVC2.addTarget(self, action: #selector(back(_:)), for: UIControl.Event.touchUpInside)
        buttonVC2.layer.cornerRadius = 8.0
        buttonVC2.layer.borderWidth = 2.0
        buttonVC2.layer.borderColor = (UIColor .white).cgColor
        view.addSubview(buttonVC2)
        
        let labelVC2 = UILabel(frame: CGRect(x: 50, y: 150, width: 350, height: 40))
        labelVC2.text = "Hello, \(name), enter your data: age and sex"
        view.addSubview(labelVC2)
        
        textField1VC2.backgroundColor = .white
        textField1VC2.placeholder = "Enter age"
        textField1VC2.layer.cornerRadius = 8.0
        textField1VC2.layer.borderColor = (UIColor .gray).cgColor
        textField1VC2.layer.borderWidth = 1.0 // узнать отступы
        textField1VC2.delegate = self
        view.addSubview(textField1VC2)
        
        textField2VC2.backgroundColor = .white
        textField2VC2.placeholder = "Enter sex"
        textField2VC2.layer.cornerRadius = 8.0
        textField2VC2.layer.borderColor = (UIColor .gray).cgColor
        textField2VC2.layer.borderWidth = 1.0 // узнать отступы
        textField2VC2.delegate = self
        view.addSubview(textField2VC2)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard !string.isEmpty else {
            return true
        }
        guard textField == textField1VC2, string <= "9", string >= "0" else {
            guard textField == textField2VC2, textField2VC2.text?.count ?? 0 < 1,
                  (string == "M" || string == "m" || string == "F" || string == "f") else {
                return false
            }
            return true
        }
        return true
    }
    
    @objc
    func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        guard let age = textField1VC2.text, let sex = textField2VC2.text,
              Int(age) ?? 0 > 50, (sex == "M" || sex == "m") else {
            guard let sex = textField2VC2.text, (sex == "F" || sex == "f") else {
                delegateVC2?.changeBgColor(where: .green)
                return
            }
            delegateVC2?.changeBgColor(where: .yellow)
            return
        }
        delegateVC2?.changeBgColor(where: .red)
    }
    
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

}
