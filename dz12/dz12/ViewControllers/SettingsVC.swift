//
//  SettingsVC.swift
//  dz12
//
//  Created by Ivan Klishevich on 25.07.2021.
//

import UIKit

class SettingsVC: UIViewController {

    @IBOutlet weak var navBarView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(setBackground())

        navBarView.layer.zPosition = 1
    }

}
