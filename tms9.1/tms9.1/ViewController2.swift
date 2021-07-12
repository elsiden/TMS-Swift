//
//  ViewController2.swift
//  tms9.1
//
//  Created by Ivan Klishevich on 12.07.2021.
//

import UIKit

class ViewController2: UIViewController, UITextFieldDelegate {

    
//    @IBOutlet weak var resultLabel: UILabel!
//    var resultString: String = ""
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    
    weak var delegate: ViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        textField1.delegate = self
        textField2.delegate = self
//        resultLabel.text = resultString
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textField1 {
            textField2.becomeFirstResponder()
        } else {
            if textField == textField2 {
                textField.resignFirstResponder()
            }
        }
        return true
    }
    
    @IBAction func closeButtonAction(_ sender: UIButton) {
        let summ = Int(textField1.text!)! + Int(textField2.text!)!
        delegate?.result(value: summ)
        
        dismiss(animated: true, completion: nil)
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("viewController2 prepare(for segue: UIStoryboardSegue, sender: Any?)")
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
