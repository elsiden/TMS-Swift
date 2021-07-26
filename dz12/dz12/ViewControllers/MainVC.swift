//
//  MainViewController.swift
//  dz12
//
//  Created by Ivan Klishevich on 25.07.2021.
//

import UIKit

class MainVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
//        let deviceType = UIDevice().type
//        nameLabel.font = (deviceType == .iPhone8 ? nameLabel.font.withSize(35) : nameLabel.font.withSize(40))
        
    }
    
    func getViewController(from sb: String) -> UIViewController? {
        let storyboard = UIStoryboard(name: sb, bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() else { return nil }
        return vc
    }

    @IBAction func startGameBtn(_ sender: UIButton) {
        guard let vc = getViewController(from: "Chessboard") else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func resultsBtn(_ sender: UIButton) {
        guard let vc = getViewController(from: "Results") else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func settingsBtn(_ sender: UIButton) {
        guard let vc = getViewController(from: "Settings") else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
