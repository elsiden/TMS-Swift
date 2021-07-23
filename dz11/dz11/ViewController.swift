//
//  ViewController.swift
//  dz11
//
//  Created by Ivan Klishevich on 19.07.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var zeroButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let deviceType = UIDevice().type
        
        for value in buttons {
            value.layer.cornerRadius = value.frame.size.width / (deviceType == .iPhone8 ? 2.7 : 2.0)
        }
        zeroButton.layer.cornerRadius = zeroButton.frame.size.width / (deviceType == .iPhone8 ? 6.0 : 2.0)
    }


}

