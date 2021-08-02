//
//  UIViewController+CoreKit.swift
//  dz12
//
//  Created by Ivan Klishevich on 27.07.2021.
//

import UIKit

extension UIViewController {
    @IBAction func backButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func setBackground() -> UIView {
        let imageView = UIImageView(image: UIImage(named: "bg"))
        let ImageViewSize = CGSize(width: view.bounds.size.width, height: view.bounds.size.height)
        imageView.frame = CGRect(origin: .zero, size: ImageViewSize)
        imageView.layer.zPosition = -1
        return imageView
    }
}
