//
//  UIView+CoreKit.swift
//  CheckersProject
//
//  Created by Ivan Klishevich on 31.08.2021.
//

import UIKit

extension UIView {
    func addBlurToPossibleSteps() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = bounds
        blurView.tag = 10
        addSubview(blurView)
    }
    
    func removeBlur() {
        self.subviews.first(where: {$0.tag == 10})?.removeFromSuperview()
    }
}
