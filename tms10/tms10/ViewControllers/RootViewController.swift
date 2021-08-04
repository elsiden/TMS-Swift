//
//  ViewController.swift
//  tms10
//
//  Created by Ivan Klishevich on 12.07.2021.
//

import UIKit

class RootViewController: UIViewController {
    // mark: - outlets, var, let
    // mark: - life cycle
    // mark: - custom methods
    // mark: - @IBAction, @objc and etc..
    // mark: - delegate methods
    
    
    
    // mark: - outlets, var, let
    
    
    // mark: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // mark: - custom methods
    func getViewController(from id: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let currentViewController = storyboard.instantiateViewController(withIdentifier: id)
        currentViewController.modalTransitionStyle = .crossDissolve
        currentViewController.modalPresentationStyle = .fullScreen
        return currentViewController
    }
    
    // mark: - @IBAction, @objc and etc..
    @IBAction func greenButtonAction(_ sender: UIButton) {
        self.navigationController?.pushViewController(getViewController(from: "GreenViewController"), animated: true)
    }
    
    @IBAction func redButtonAction(_ sender: UIButton) {
        self.navigationController?.pushViewController(getViewController(from: "RedViewController"), animated: true)
    }
    
//    @objc
//    func ButtonAction(_ sender: UIButton) {
//
//    }
    
    // mark: - delegate methods
    


}

