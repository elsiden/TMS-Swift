//
//  BlueViewController.swift
//  tms13
//
//  Created by Ivan Klishevich on 28.07.2021.
//

import UIKit

class BlueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        navigationController?.pushViewController(getNextViewController(storyboardId: "OrangeViewController"), animated: true)
    }
}
