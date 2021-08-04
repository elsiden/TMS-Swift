//
//  ViewController.swift
//  tms15
//
//  Created by Ivan Klishevich on 02.08.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var centerYConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func buttonAction(_ sender: UIButton) {
        presentAlertControlelr(with: "Hello", message: "ios dev", actions: UIAlertAction(title: "Ok", style: .default, handler: { _ in
            self.startAnimation()
        }))
    }  
    
    func startAnimation() {
        UIView.animateKeyframes(withDuration: 0.5, delay: 0.0, options: [.autoreverse, .repeat]) {
            self.centerYConstraint.constant = 100.0
            self.view.layoutIfNeeded()
        } completion: { _ in
            
        }

    }

}

