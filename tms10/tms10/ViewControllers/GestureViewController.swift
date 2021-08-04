//
//  GestureViewController.swift
//  tms10
//
//  Created by Ivan Klishevich on 14.07.2021.
//

import UIKit

enum Music: String, CaseIterable {
    case sound1 = "Bethowen"
    case sound2 = "Mozart"
}

enum Direction {
    case up, down, left, right
}

enum Sex {
    case male
    case female
    
    static func getTitle(from sex: Sex) -> String {
        switch sex {
        case .male: return "Male"
        case .female: return "Female"
        }
    }
}

class GestureViewController: UIViewController {
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    
    var tapPoint: CGPoint = .zero
    let view4: UIView? = nil
    
    var currentView: UIView? = nil
    var defaultOrigin: CGPoint = .zero
    
    var direct: Direction? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Gesture ViewController"

//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureRecognizer(_:)))
//        view.addGestureRecognizer(tapGesture)
////        view1.addGestureRecognizer(tapGesture)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizer(_:)))
        view.addGestureRecognizer(panGesture)
        
//        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestureRecognizer(_:)))
//        swipeDownGesture.direction = .down
//        view.addGestureRecognizer(swipeDownGesture)
//
//        let swipeDLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestureRecognizer(_:)))
//        swipeDLeftGesture.direction = .left
//        view.addGestureRecognizer(swipeDLeftGesture)
        
//        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotationGestureRecognizer(_:)))
//        view.addGestureRecognizer(rotationGesture)
        
//        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressGestureRecognizer(_:)))
//        longPressGesture.minimumPressDuration = 5.0
//        view.addGestureRecognizer(longPressGesture)
        
//        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchGestureRecognizer(_:)))
//        view.addGestureRecognizer(pinchGesture)
        
        let sound: Music = .sound1
        print(sound.rawValue)
        
        Sex.getTitle(from: .male)
        
//        Music.AllCases
        
//        print(view3)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.tapPoint = touches.first?.location(in: view) ?? .zero
    }
    
    @objc
    func tapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        print("tap \(sender.location(in: view1))")
    }
    
//    @objc
//    func panGestureRecognizer(_ sender: UIPanGestureRecognizer) {
////        print("pan")
//
//        let location = sender.location(in: view)
//        let translation = sender.translation(in: view)
//
////        view1.center = sender.location(in: view)
//
//        switch sender.state {
//        case .began:
//            if view1.frame.contains(location) {
//                currentView = view1
//                defaultOrigin = view1.frame.origin
//            } else if view2.frame.contains(location) {
//                currentView = view2
//            }
//        case .changed:
//            guard currentView != nil else { return }
//            view.bringSubviewToFront(currentView!)
//            currentView!.center = CGPoint(x: currentView!.center.x + translation.x, y: currentView!.center.y + translation.y)
//            sender.setTranslation(.zero, in: view)
//        case .ended:
//            print("ended")
//        case .failed:
//            print("failed")
//        case .cancelled:
//            print("cancelled")
//        default:
//            break
//        }
//    }
    
    @objc
    func swipeGestureRecognizer(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .down:
            print("down")
        case .left:
            print("left")
        case .right:
            print("right")
        case .up:
            print("up")
        default:
            break
        }
    }
    
    @objc
    func rotationGestureRecognizer(_ sender: UIRotationGestureRecognizer) {
        print("rotation: \(sender.rotation * .pi / 180.0)")
        print("velocity: \(sender.velocity)")
    }
    
    @objc
    func longPressGestureRecognizer(_ sender: UILongPressGestureRecognizer) {
        print("long press")
    }
    
    @objc
    func pinchGestureRecognizer(_ sender: UIPinchGestureRecognizer) {
        print("scale: \(sender.scale)")
        print("velocity: \(sender.velocity)")
    }
    
    @IBAction func backToRoot(_ sender: UIButton) {
//        self.navigationController?.popViewController(animated: true)
        navigationController?.popToRootViewController(animated: true)
        
//        guard let vc = navigationController?.viewControllers.first(where: {($0 as? RootViewController) != nil}) else {return}
//        navigationController?.popToViewController(vc, animated: true)
    }
    
    
    
    
    
    
    
    @objc
    func panGestureRecognizer(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        switch sender.state {
        case .began:
            if view2.frame.contains(self.tapPoint) {
                currentView = view2
                print("add")
            }
        case .changed:
            guard currentView != nil else { return }
            view.bringSubviewToFront(currentView!)
            currentView!.center = CGPoint(x: currentView!.center.x + translation.x, y: currentView!.center.y + translation.y)
            sender.setTranslation(.zero, in: view)
        case .ended:
            currentView = nil
        default:
            break
        }
    }
}
