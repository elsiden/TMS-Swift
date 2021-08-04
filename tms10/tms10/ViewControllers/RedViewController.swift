//
//  RedViewController.swift
//  tms10
//
//  Created by Ivan Klishevich on 14.07.2021.
//

import UIKit

class RedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Red ViewController"
    }
    
    func getViewController(from id: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let currentViewController = storyboard.instantiateViewController(withIdentifier: id)
        currentViewController.modalTransitionStyle = .crossDissolve
        currentViewController.modalPresentationStyle = .fullScreen
        return currentViewController
    }
    
    @IBAction func gestureButtonAction(_ sender: UIButton) {
        self.navigationController?.pushViewController(getViewController(from: "GestureViewController"), animated: true)
    }
    
    @IBAction func backToRoot(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}
