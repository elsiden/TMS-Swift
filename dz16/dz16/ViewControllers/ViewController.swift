//
//  ViewController.swift
//  dz16
//
//  Created by Ivan Klishevich on 05.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let vcIds = ["RGBone", "ColorsNames", "Students"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getViewController(from sb: String) -> UIViewController? {
        let storyboard = UIStoryboard(name: sb, bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() else { return nil }
        return vc
    }
    
    @IBAction func task1Btn(_ sender: UIButton) {
        guard let vc = getViewController(from: vcIds[sender.tag]) else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

