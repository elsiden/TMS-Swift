//
//  ViewController2.swift
//  tms17.1
//
//  Created by Ivan Klishevich on 07.08.2021.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailSwitch: UISwitch!
    @IBOutlet weak var pushSwitch: UISwitch!
    
    var human: Human = Human()
    
    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification, object: emailTextField, queue: .main) { _ in
            guard let emailText = self.emailTextField.text else { return }
            self.emailSwitch.isEnabled = emailText.isValidEmail()
            if !emailText.isValidEmail() {
                self.emailSwitch.setOn(false, animated: true)
            }
            
            self.saveDataToUserDefaults()
        }
        
        getHuman()
        applyDataFromUserDefaults()
        helloLabel.text = "Hello \(human.name ?? "")"
    }

    @IBAction func switchValueDidChange(_ sender: UIButton) {
        saveDataToUserDefaults()
    }
    
    func saveDataToUserDefaults() {
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(self.emailTextField.text ?? "", forKey: KeysUserDefaults.email.rawValue)
        userDefaults.setValue(self.emailSwitch.isOn, forKey: KeysUserDefaults.stateSwitchEmail.rawValue)
        userDefaults.setValue(self.pushSwitch.isOn, forKey: KeysUserDefaults.stateSwitchPush.rawValue)
    }
    
    func applyDataFromUserDefaults() {
        let userDefaults = UserDefaults.standard
        let email = (userDefaults.object(forKey: KeysUserDefaults.email.rawValue) as? String) ?? ""
        self.emailTextField.text = email
        self.emailSwitch.isOn = userDefaults.bool(forKey: KeysUserDefaults.stateSwitchEmail.rawValue)
        self.pushSwitch.isOn = userDefaults.bool(forKey: KeysUserDefaults.stateSwitchPush.rawValue)

        self.emailSwitch.isEnabled = email.isValidEmail()
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
}
