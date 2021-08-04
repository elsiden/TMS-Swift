//
//  UIView+CoreKit.swift
//  tms13
//
//  Created by Ivan Klishevich on 28.07.2021.
//

import UIKit

extension UIView {
    func addShadow(with color: UIColor, opacity: Float, shadowOffset: CGSize = .zero) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowRadius = self.layer.cornerRadius
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = shadowOffset
    }
}
