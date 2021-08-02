//
//  MainViewController.swift
//  dz12
//
//  Created by Ivan Klishevich on 25.07.2021.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var startGameBtn: UIButton!
    @IBOutlet weak var resultsBtn: UIButton!
//    @IBOutlet weak var settingsBtn: UIButton!
    @IBOutlet weak var settingsView: UIView!
    
    let vcIds: [String] = ["Chessboard", "Results", "Settings", "Info"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGesture(_:)))
//        tapGesture.delegate = self
//        settingsView.addGestureRecognizer(tapGesture)
//
//        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressGesture(_:)))
//        longPressGesture.delegate = self
//        settingsView.addGestureRecognizer(longPressGesture)
    }
    
//    @objc func tapGesture(_ sender: UITapGestureRecognizer) {
//        UIView.animate(withDuration: 0.3) {
//            self.settingsView.transform = self.settingsView.transform.scaledBy(x: 1.3, y: 1.3)
//        }
//    }
//
//    @objc func longPressGesture(_ sender: UILongPressGestureRecognizer) {
//        UIView.animate(withDuration: 0.3) {
//            self.settingsView.transform = self.settingsView.transform.scaledBy(x: 1.3, y: 1.3)
//        }
//    }
    
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

extension MainVC: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
