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
