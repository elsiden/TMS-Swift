//
//  MainViewController.swift
//  dz12
//
//  Created by Ivan Klishevich on 25.07.2021.
//

import UIKit

class MainVC: UIViewController {
    
    let vcIds: [String] = ["Chessboard", "Results", "Settings"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getViewController(from sb: String) -> UIViewController? {
        let storyboard = UIStoryboard(name: sb, bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() else { return nil }
        return vc
    }
    
    @IBAction func goToNewVcButton(_ sender: UIButton) {
        guard let vc = getViewController(from: vcIds[sender.tag]) else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
