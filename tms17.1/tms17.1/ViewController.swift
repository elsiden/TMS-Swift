//
//  ViewController.swift
//  tms17.1
//
//  Created by Ivan Klishevich on 05.08.2021.
//

import UIKit

enum Gender: Int {
    case male = 0
    case female = 1
    case other = 2
}

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!

    var human: Human = Human()
    
    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        //        print(documentDirectory)
        
        
        
        getHuman()
        textField.text = human.name
        
        guard !(human.name ?? "").isEmpty else { return }
        goToNextScreen()
    }

    @IBAction func nextButton(_ sender: UIButton) {
        guard let name = textField.text, !name.isEmpty, human.gender != nil else {
            presentAlertController(with: nil, message: "Enter your name or gender", useTextField: false, preferredStyle: .alert)
            return
        }
        
        human.name = name
        saveHuman()

        goToNextScreen()
    }
    
    @IBAction func valueDidChange(_ sender: UISegmentedControl) {
        guard let gender = Gender(rawValue: sender.selectedSegmentIndex) else { return }
        human.gender = gender
    }
    
    func saveHuman() {
        let data = try? NSKeyedArchiver.archivedData(withRootObject: human, requiringSecureCoding: true)
        
        
        let fileURL = documentDirectory.appendingPathComponent("human")
        print(fileURL)
        try? data?.write(to: fileURL)
//        if let data = data {
//            UserDefaults.standard.setValue(data, forKey: KeysUserDefaults.human.rawValue)
//        }
    }
    
    func getHuman() {
        let fileURL = documentDirectory.appendingPathComponent("human")
        guard let data = FileManager.default.contents(atPath: fileURL.absoluteString.replacingOccurrences(of: "file://", with: "")) else { return }
        do {
            guard let object = try NSKeyedUnarchiver.unarchivedObject(ofClass: Human.self, from: data) else { return }
            self.human = object
        } catch (let e) {
            print(e)
        }
    }
    
    func goToNextScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController2")
        navigationController?.setViewControllers([vc], animated: true)
    }
}

