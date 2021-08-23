//
//  UIViewController+CoreKit.swift
//  CheckersProject
//
//  Created by Ivan Klishevich on 13.08.2021.
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
}
