//
//  ViewController.swift
//  dz9
//
//  Created by Ivan Klishevich on 12.07.2021.
//

import UIKit

protocol ViewControllerDelegate: class {
    func changeBackgroundColor(_ color: UIColor?)
}

class ViewController: UIViewController, UITextFieldDelegate, ViewControllerDelegate {

    @IBOutlet weak var labelVC1: UILabel!
    @IBOutlet weak var textFieldVC1: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldVC1.delegate = self
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard string <= "z", string >= "A" else {
            return false
        }
        return true
    }
    
    @IBAction func forward(_ sender: UIButton) {
        guard let name = textFieldVC1.text, !name.isEmpty else {
            labelVC1.text = ("Enter name!!!")
            return
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "ViewController2") as? ViewController2 {
            vc.modalTransitionStyle = .flipHorizontal
            vc.modalPresentationStyle = .fullScreen
            vc.nameVC1 = textFieldVC1.text!
            vc.delegate = self
            present(vc, animated: true, completion: nil)
            textFieldVC1.text = ""
            labelVC1.text = ""
        }
    }
    
    func changeBackgroundColor(_ color: UIColor?) {
    view.backgroundColor = color
    }
}
