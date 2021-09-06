//
//  Checkers+Appearance.swift
//  CheckersProject
//
//  Created by Ivan Klishevich on 05.09.2021.
//

import UIKit

extension Checkers {
    func setBackground(where bg: String) -> UIView {
        background = UIImageView(image: UIImage(named: bg))
        
        guard let image = background else { return UIView() }
        let imageSize = CGSize(width: view.bounds.size.width, height: view.bounds.size.height)
        image.frame = CGRect(origin: .zero, size: imageSize)
        image.layer.zPosition = -1
        return image
    }
    
    func setShadow(where view: UIView) {
        view.layer.shadowOffset = CGSize(width: 15, height: 15)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 3
        view.layer.shadowOpacity = 1
    }
    
    func cornerRadiusForViews() {
        settingsView.layer.cornerRadius = 30
        settingsView.clipsToBounds = true
        
        resultsView.layer.cornerRadius = 30
        resultsView.clipsToBounds = true
        
        playersNames.layer.cornerRadius = 15
        playersNames.clipsToBounds = true
    }
    
    func whoStepImageView() {
        whoStepView.isHidden = false
        whoStepImage.image = UIImage(named: whoStep == .white ? "white" : "black")
        whoStepView.backgroundColor = UIColor(cgColor: CGColor(red: 250 / 255, green: 250 / 255, blue: 250 / 255, alpha: 0.3))
        whoStepView.layer.cornerRadius = 10
        whoStepView.transform = whoStepView.transform.scaledBy(x: 0.0, y: 0.0)
    }
    
    func setWhoStepLabel() {
        let firstStep = Int.random(in: 0...1)
        let secondStep = 1 - firstStep
        
        firstPlayer.playerChecker = firstStep
        secondPlayer.playerChecker = secondStep
        
        whoStepLabel.isHidden = false
        whoStepLabel.text = firstStep == 0 ? firstPlayer.playerName : secondPlayer.playerName
        whoStepLabel.transform = whoStepLabel.transform.scaledBy(x: 0.0, y: 0.0)
    }
}
