//
//  ViewController.swift
//  dz9pin
//
//  Created by Ivan Klishevich on 13.07.2021.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
    func changeBgColor(where color: UIColor)
}

class ViewController: UIViewController, UITextFieldDelegate, ViewControllerDelegate {

    let textFieldVC1 = UITextField(frame: CGRect(x: 100, y: 200, width: 200, height: 40))
    let labelVC1 = UILabel(frame: CGRect(x: 150, y: 250, width: 200, height: 40))
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let color1 = UIColor(red: 11 / 255, green: 218 / 255, blue: 81 / 255, alpha: 1).cgColor
//        let color2 = UIColor(red: 65 / 255, green: 61 / 255, blue: 81 / 255, alpha: 1).cgColor
//        let color3 = UIColor(red: 11 / 255, green: 218 / 255, blue: 81 / 255, alpha: 1).cgColor
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = self.view.bounds
//
//        gradientLayer.colors = [color1, color2, color3]
//        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
//        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
//
//        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        view.backgroundColor = UIColor(red: 11 / 255, green: 218 / 255, blue: 81 / 255, alpha: 1)

//        textFieldVC1.center = self.view.center // найти выравнивание по иксу + почему первые буквы большие
        textFieldVC1.backgroundColor = .white
        textFieldVC1.placeholder = "Enter name"
        textFieldVC1.layer.cornerRadius = 8.0
        textFieldVC1.layer.borderColor = (UIColor .gray).cgColor
        textFieldVC1.layer.borderWidth = 1.0 // узнать отступы
        textFieldVC1.delegate = self
        view.addSubview(textFieldVC1)
        
        let buttonVC1 = UIButton(frame: CGRect(x: 140, y: 350, width: 120, height: 40))
        buttonVC1.setTitle("Leeet's go", for: .normal)
        buttonVC1.addTarget(self, action: #selector(forward(_:)), for: UIControl.Event.touchUpInside)
        buttonVC1.layer.cornerRadius = 8.0
        buttonVC1.layer.borderWidth = 2.0
        buttonVC1.layer.borderColor = (UIColor .white).cgColor
        view.addSubview(buttonVC1)
        
        view.addSubview(labelVC1)
    }
    
    @objc func forward(_ sender: UIButton) {
        guard let name = textFieldVC1.text, !name.isEmpty else {
            labelVC1.text = "Enter name..."
            return
        }
        
        let storyboard = UIStoryboard(name: "ViewController2", bundle: nil)
        
        if let vc = storyboard.instantiateInitialViewController() as? ViewController2 {
            vc.name = textFieldVC1.text!
            labelVC1.text = ""
            textFieldVC1.text = ""
            
            vc.delegateVC2 = self
            
            vc.modalTransitionStyle = .flipHorizontal
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard !string.isEmpty else {
            return true
        }
        guard string <= "z", string >= "A" else {
            return false
        }
        return true
    }
    
    func changeBgColor(where color: UIColor) {
        view.backgroundColor = color
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

}
