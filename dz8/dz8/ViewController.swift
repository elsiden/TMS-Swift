//
//  ViewController.swift
//  dz8
//
//  Created by Ivan Klishevich on 07.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let textField1 = UITextField(frame: CGRect(x: 50, y: 100, width: 320, height: 30))
    let labelPlus = UILabel(frame: CGRect(x: 197, y: 150, width: 20, height: 20))
    let textField2 = UITextField(frame: CGRect(x: 50, y: 200, width: 320, height: 30))
    let button = UIButton(frame: CGRect(x: 197, y: 250, width: 20, height: 20))
    let labelSum = UILabel(frame: CGRect(x: 157, y: 300, width: 100, height: 30))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .lightGray
        
        
//        =================================================
        
        let rows = 8
        let columns = 8
        let squareSize = CGSize(width: 40, height: 40)
        let xOffset = 50
        let yOffset = 400
        var check = false

        for row in 0...rows-1 {
            for col in 0...columns-1 {
                let color = check ? UIColor.black : UIColor.white

                let squarePos = CGPoint(x: CGFloat(col) * squareSize.width + CGFloat(xOffset), y: CGFloat(row) * squareSize.height + CGFloat(yOffset))
                let square = UIView(frame: CGRect(origin: squarePos, size: squareSize))
                square.backgroundColor = color

                view.addSubview(square)

                check = !check
            }
            check = !check
        }
        
//        =================================================
        
        textField1.backgroundColor = .white
        view.addSubview(textField1)
        
        
        labelPlus.text = "+"
        view.addSubview(labelPlus)
        
        
        textField2.backgroundColor = .white
        view.addSubview(textField2)
        
        
        button.setTitle("=", for: .normal)
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonTap(_:)), for: UIControl.Event.touchUpInside)
        
        
        view.addSubview(labelSum)
        
    }

    
    
    @objc
    func buttonTap(_ sender: UIButton) {
        var summ = 0
        
        func calc(where num1: String?, and num2: String?) {
            if let num1 = Int(num1!) {
                summ += num1
                if let num2 = Int(num2!) {
                    summ += num2
                    labelSum.text = "\(summ)"
                } else {
                    labelSum.text = "Error"
                }
            } else {
                labelSum.text = "Error"
            }
        }
        calc(where: textField1.text, and: textField2.text)
    }

}
