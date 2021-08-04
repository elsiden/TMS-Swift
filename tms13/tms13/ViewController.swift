//
//  ViewController.swift
//  tms13
//
//  Created by Ivan Klishevich on 28.07.2021.
//

import UIKit

class ViewController: UIViewController {
    var imageView: UIView!
    
    @IBOutlet weak var startButton: UIButton!

    var isLong = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imageView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 250, height: 250)))
        imageView.backgroundColor = .red
        imageView.center = view.center
//        imageView.image = UIImage(named: "sign_up_40")
//        imageView.animationImages = getArrayImages()
//        imageView.contentMode = .scaleAspectFit
//        imageView.animationRepeatCount = 1
//        imageView.isHidden = true
//        imageView.animationRepeatCount = 3
//        imageView.animationDuration = 2
        
        imageView.addShadow(with: .black, opacity: 0.9, shadowOffset: CGSize(width: 5, height: 5))
        startButton.addShadow(with: .red, opacity: 0.5, shadowOffset: CGSize(width: 10, height: 10))
        
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.red.cgColor, UIColor.blue.cgColor, UIColor.green.cgColor]
        gradient.startPoint = CGPoint(x: 0.3, y: 0.3)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.frame = CGRect(origin: .zero, size: imageView.frame.size)
        gradient.type = .axial
        imageView.layer.addSublayer(gradient)
        
        let longRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longRecognizer(_:)))
        longRecognizer.minimumPressDuration = 0.1
        longRecognizer.delegate = self
        imageView.addGestureRecognizer(longRecognizer)
        
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panRecognizer(_:)))
        panRecognizer.delegate = self
        imageView.addGestureRecognizer(panRecognizer)
        
        let rotation = UIRotationGestureRecognizer(target: self, action: #selector(rotationRecognizer(_:)))
        imageView.addGestureRecognizer(rotation)
        
//        UIView.animate(withDuration: 1, delay: 0, options: [.autoreverse, .repeat]) {
//            self.imageView.transform = CGAffineTransform(rotationAngle: 30 * .pi / 180).scaledBy(x: 0.5, y: 0.5).translatedBy(x: 0, y: 100)
//        }
        
//        imageView.transform = .identity
        view.addSubview(imageView)
    }
    
    @objc func rotationRecognizer(_ sender: UIRotationGestureRecognizer) {
        imageView.transform = imageView.transform.rotated(by: sender.rotation)
    }
    
    @objc func longRecognizer(_ sender: UILongPressGestureRecognizer) {
        guard !isLong else { return }
        isLong = true 
        UIView.animate(withDuration: 0.3) {
            self.imageView.transform = self.imageView.transform.scaledBy(x: 1.3, y: 1.3)
        }
    }
    
    @objc func panRecognizer(_ sender: UIPanGestureRecognizer) {
        guard isLong else { return }
        
        print("panRecognizer")
        let translation = sender.translation(in: view)
        switch sender.state {
        case .changed:
            imageView.frame.origin = CGPoint(x: imageView.frame.origin.x + translation.x, y: imageView.frame.origin.y + translation.y)
            sender.setTranslation(.zero, in: view)
        case .ended:
            UIView.animate(withDuration: 0.3) {
                self.imageView.transform = .identity
            }
            isLong = false
        default: break
        }
    }
    
    func getArrayImages() -> [UIImage] {
        var array: [UIImage] = []
        
        for value in 0...40 {
            guard let image = UIImage(named: "sign_up_\(value)") else { continue }
            array.append(image)
        }
        
        return array
    }
    
    @IBAction func startAnimationButton(_ sender: UIButton) {
//        imageView.isHidden = false
//        imageView.isAnimating ? imageView.stopAnimating() : imageView.startAnimating()
//        sender.setTitle(imageView.isAnimating ? "Stop animating" : "Start animating", for: .normal)
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        navigationController?.pushViewController(getNextViewController(storyboardId: "RedViewController"), animated: true)
    }


}

extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

