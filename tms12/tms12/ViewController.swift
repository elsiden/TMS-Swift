//
//  ViewController.swift
//  tms12
//
//  Created by Ivan Klishevich on 19.07.2021.
//

import UIKit

enum DirectionImage {
    case top, left, right, bottom
}

class ViewController: UIViewController {
    
    let imageView = UIImageView(image: UIImage(named: "bg"))
    var x: CGFloat = 0
    var y: CGFloat = 0
    var count = 0
    
    var isTop = true
    var isStop = false
    
    var countTick: Int = 0
    var timer: Timer?
    var label: UILabel!

    var currentDirection: DirectionImage = .left
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
        label = UILabel(frame: CGRect(x: 0, y: 50, width: 100, height: 100))
        label.text = "\(countTick)"
        label.center.x = view.center.x
        view.addSubview(label)
        
        
        let ImageViewSize = CGSize(width: 100, height: 100)
        imageView.frame = CGRect(origin: .zero, size: ImageViewSize)
        imageView.center = view.center
        view.addSubview(imageView)
        
        self.y = view.center.y
        animationFunc()
    }
    
    @objc func timerFunc() {
        countTick += 1
        label.text = "\(countTick)"
    }
    
    func animationFunc(duration: TimeInterval = 1) {
        UIView.animate(withDuration: duration, delay: 0, options: .curveLinear) {
            self.imageView.frame.origin = CGPoint(x: self.x, y: self.y)
        } completion: { _ in
            guard !self.isStop else { return }
            
            switch self.currentDirection {
            case .top:
                self.y = 50
                self.currentDirection = .right
            case .bottom:
                self.y = self.view.center.y
                self.currentDirection = .left
            case .left:
                self.x = 0
                self.currentDirection = .top
            case .right:
                self.x = self.view.center.x
                self.currentDirection = .bottom
            }
            
            self.count += 1

            self.animationFunc()
        }

    }
    
    @IBAction func stopButton( _ sender: UIButton) {
        isStop = true
        
        if timer!.isValid {
            timer?.invalidate()
        } else {
            timer = Timer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
            RunLoop.main.add(timer!, forMode: .common)
        }
        
    }
    
    override func viewWillLayoutSubviews() {
//        let x = imageView.bounds.size.width
//        imageView.bounds.size.width = imageView.bounds.size.height
//        imageView.bounds.size.height = x
//        imageView.center = view.center
        
    }
}

