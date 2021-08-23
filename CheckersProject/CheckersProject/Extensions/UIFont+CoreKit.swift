//
//  UIFont+CoreKit.swift
//  CheckersProject
//
//  Created by Ivan Klishevich on 13.08.2021.
//

import UIKit

extension UIFont {
    static func dited(with size: CGFloat) -> UIFont {
        return UIFont(name: "Dited", size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
