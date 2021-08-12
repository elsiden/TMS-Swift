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
    
    @discardableResult
    func presentAlertController(with title: String?, message: String?, prefferedStyle: UIAlertController.Style = .alert, actions: UIAlertAction...) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: prefferedStyle)
        actions.forEach { alert.addAction($0) }
        present(alert, animated: true, completion: nil)
        
        return alert
    }
}
