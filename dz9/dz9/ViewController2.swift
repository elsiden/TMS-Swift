//
//  ViewController2.swift
//  dz9
//
//  Created by Ivan Klishevich on 12.07.2021.
//

import UIKit



class ViewController2: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var labelVC2: UILabel!
    @IBOutlet weak var textField1VC2: UITextField!
    @IBOutlet weak var textField2VC2: UITextField!
    
    weak var delegate: ViewControllerDelegate?
    
    var nameVC1: String = ""
//    var view1: UIView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelVC2.text = ("Hello, \(nameVC1), enter your data: age and sex:")
        textField2VC2.delegate = self
        textField1VC2.delegate = self
        
    }
    
    
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        guard let age = textField1VC2.text, let name = textField2VC2.text,
            Int(age) ?? 0 > 50, (name == "M" || name == "m") else {
            guard let name = textField2VC2.text, (name == "F" || name == "f") else {
                delegate?.changeBackgroundColor(.green)
                return
            }
            delegate?.changeBackgroundColor(.yellow)
            return
        }
        delegate?.changeBackgroundColor(.red)
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard !string.isEmpty else {
            return true
        }
        guard textField == textField1VC2, string <= "9", string >= "0" else {
            guard textField == textField2VC2, textField.text?.count ?? 0 < 1,
                    (string == "M" || string == "F" ||
                    string == "m" || string == "f") else {
                return false
            }
            return true
        }
        return true
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    

}
