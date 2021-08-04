//
//  GreenViewController.swift
//  tms10
//
//  Created by Ivan Klishevich on 14.07.2021.
//

import UIKit

class GreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Green ViewController"
    }

    
    @IBAction func backToRoot(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
