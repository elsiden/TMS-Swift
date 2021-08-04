//
//  UIViewController+CoreKit.swift
//  tms13
//
//  Created by Ivan Klishevich on 28.07.2021.
//

import UIKit

extension UIViewController {
    func getNextViewController(storyboardId: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: storyboardId)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
