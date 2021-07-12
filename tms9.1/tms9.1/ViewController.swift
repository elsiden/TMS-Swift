//
//  ViewController.swift
//  tms9.1
//
//  Created by Ivan Klishevich on 12.07.2021.
//

import UIKit

protocol ViewControllerDelegate: class {
    func result(value: Int)
}

class ViewController: UIViewController, ViewControllerDelegate {
    
    
    
//    @IBOutlet weak var textField1: UITextField!
//    @IBOutlet weak var textField2: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func resultButtonAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "ViewController2", bundle: nil)
//        if let vc = storyboard.instantiateViewController(withIdentifier: "ViewController2") as? ViewController2 {
        if let vc = storyboard.instantiateInitialViewController() as? ViewController2 {
//            let summ = Int(textField1.text!)! + Int(textField2.text!)!
//            vc.resultString = "Result: \(summ)"
            vc.delegate = self
            
            vc.modalTransitionStyle = .flipHorizontal
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
    }
    
    func result(value: Int) {
        print("Delegate func result\n\(value)")
        resultLabel.text = "\(value)"
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("viewController1 prepare(for segue: UIStoryboardSegue, sender: Any?)")
//        print(segue.identifier)
//        let summ = Int(textField1.text!)! + Int(textField2.text!)!
        
//        if let vc = segue.destination as? ViewController2 {
//            vc.resultString = "Result: \(summ)"
//            print(summ)
//        }
        
//        segue.destination
    }
    

}
