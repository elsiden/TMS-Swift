//
//  ViewController.swift
//  tms8
//
//  Created by Ivan Klishevich on 05.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var view1: UIView = UIView()
    let textField = UITextField()
    
    override func awakeFromNib() { // самый первый при создании
        super.awakeFromNib()
        print("orange awakeFromNib")
    }

    override func viewDidLoad() { // загрузилось но не показалось
        super.viewDidLoad()
        print("orange viewDidLoad")
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.lightGray
//        view.backgroundColor = .red
        
        
        let view1 = UIView(frame: CGRect(x: 87, y: 592, width: 240, height: 128))
        
//        let frameView1 = CGRect(x: 87, y: 592, width: 240, height: 128)
//        let view1 = UIView(frame: frameView1)
        
//        view1.frame = frameView1
        
        view1.backgroundColor = .red
        view.addSubview(view1) // добавление на storyboard
        
        
        let colors: [UIColor] = [UIColor.black, UIColor.white, UIColor.red, UIColor.green, UIColor.blue]
        for value in 0..<colors.count {
            let newView = UIView(frame: CGRect(x: 50.0 * Double(value + 1), y: 70.0 * Double(value + 1), width: 50.0, height: 50.0))
            newView.backgroundColor = colors[value]
            view.addSubview(newView)
        }
        
//        print(view.subviews) // элементы View (массив)
        
        let view2 = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 100, height: 50)))
        view2.backgroundColor = .yellow
        view1.addSubview(view2)
        
        let label = UILabel(frame: CGRect(origin: CGPoint(x: 300, y: 300), size: CGSize(width: 100, height: 50)))
        label.text = "TEXT!!!"
        label.textColor = UIColor.white
        view.addSubview(label)
        
//        ==================
        
        let textField = UITextField(frame: CGRect(x: 170.0, y: 100.0, width: 200.0, height: 44.0))
        
//        textField.frame = CGRect(x: 170.0, y: 100.0, width: 200.0, height: 44.0)
        
        textField.backgroundColor = .white
        textField.placeholder = "Enter your name"
        view.addSubview(textField)
        
//        ==================
        
        let button = UIButton(frame: CGRect(x: 50.0, y: 600.0, width: 100.0, height: 50.0))
        button.setTitle("Button", for: .normal)
        button.backgroundColor = UIColor(red: 200 / 255, green: 175 / 255, blue: 40 / 255, alpha: 1.0)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        
        view.addSubview(button)
    }
    
    @objc
    func buttonTapped(_ sender: UIButton) {
        print("button was tapped and \(textField.text)")
    }
    
    override func viewWillAppear(_ animated: Bool) {    // перед тем как показать полностью
        super.viewWillAppear(animated)
        print("orange viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {     // когда экран показан полностью
        super.viewDidAppear(animated)
        print("orange viewDidAppear")
    }
    
    override func  viewWillLayoutSubviews() { // когда происходит пересчет размера экрана
        super.viewWillLayoutSubviews()
        
        print("orange viewWillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() { // когда пересчет размера экрана закончен
        super.viewDidLayoutSubviews()
        print("orange viewDidLayoutSubviews")
    }
    
    override func viewWillDisappear(_ animated: Bool) { // перед скрытием экрана
        super.viewWillDisappear(animated)
        print("orange viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) { // когда экран скрыт
        super.viewDidDisappear(animated)
        print("orange viewDidDisappear")
    }
    
    deinit {
        print("orange deinit")
    }
    
    // ===== РЕДКО
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) { // во время перевота экрана
        print("orange willTransition")
    }

}

