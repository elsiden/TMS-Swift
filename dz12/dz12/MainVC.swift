//
//  MainViewController.swift
//  dz12
//
//  Created by Ivan Klishevich on 25.07.2021.
//

import UIKit

class MainVC: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var startGameBtn: UIButton!
    @IBOutlet weak var resultsBtn: UIButton!
    @IBOutlet weak var settingsBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
//        zeroButton.layer.cornerRadius = zeroButton.frame.size.width / (deviceType == .iPhone8 ? 6.0 : 2.0)
//        let deviceType = UIDevice().type
//        nameLabel.font = (deviceType == .iPhone8 ? nameLabel.font.withSize(35) : nameLabel.font.withSize(40))
        
    }

    @IBAction func startGameBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Chessboard", bundle: nil)
        if let vc = storyboard.instantiateInitialViewController() as? ChessboardVC {
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .fullScreen
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func resultsBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Results", bundle: nil)
        if let vc = storyboard.instantiateInitialViewController() as? ResultsVC {
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .fullScreen
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func settingsBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Settings", bundle: nil)
        if let vc = storyboard.instantiateInitialViewController() as? SettingsVC {
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .fullScreen
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}
