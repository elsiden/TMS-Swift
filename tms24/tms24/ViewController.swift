//
//  ViewController.swift
//  tms24
//
//  Created by Ivan Klishevich on 06.09.2021.
//

import UIKit
import NVActivityIndicatorView

class ViewController: UIViewController {
    @IBOutlet weak var activityIndicator: NVActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        activityIndicator.type = .ballTrianglePath
        
//        let activity = NVActivityIndicatorView(frame: CGRect(x: 100, y: 100, width: 100, height: 100), type: .ballRotate, color: .red, padding: 0)
//        self.view.addSubview(activity)
//        activity.startAnimating()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        activityIndicator.startAnimating()
    }


}

