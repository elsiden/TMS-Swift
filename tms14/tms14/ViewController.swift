//
//  ViewController.swift
//  tms14
//
//  Created by Ivan Klishevich on 02.08.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: 300, height: 50)))
//        label.text = "My custom text!!!"
//        label.attributedText = NSAttributedString(string: "My custom text!!!",
//                                                  attributes: [
//                                                    .foregroundColor : UIColor.red,
//                                                    .strokeColor : UIColor.green,
//                                                    .strokeWidth: -2,
//                                                    .font: UIFont.systemFont(ofSize: 32, weight: .bold),
//                                                    .strikethroughStyle: NSUnderlineStyle.single.rawValue,
//                                                    .strikethroughColor: UIColor.blue
//                                                  ])
        
        var attributedString = NSAttributedString(string: "My custom text!!!",
                                                  attributes: [.foregroundColor : UIColor.red,
                                                               .strokeColor : UIColor.green,
                                                               .strokeWidth: -2,
                                                               .font: UIFont.systemFont(ofSize: 32, weight: .bold),
                                                               .strikethroughStyle: NSUnderlineStyle.single.rawValue,
                                                               .strikethroughColor: UIColor.blue])
        
        var attrs: [NSAttributedString.Key: Any] = [.foregroundColor : UIColor.red,
                                                    .strokeColor : UIColor.green,
                                                    .strokeWidth: -2,
                                                    .font: UIFont.systemFont(ofSize: 32, weight: .bold),
                                                    .strikethroughStyle: NSUnderlineStyle.single.rawValue,
                                                    .strikethroughColor: UIColor.blue]
        
        let string = "My custom text!!!"
        let myRange = (string as NSString).range(of: "My")
        let mutableAttributedString = NSMutableAttributedString(string: string)
        attrs[.foregroundColor] = UIColor.orange
        mutableAttributedString.addAttributes(attrs, range: myRange)
        
        label.attributedText = attributedString
//        label.attributedText = mutableAttributedString // changable
        
//        let attributed = attributedString.attribute(.foregroundColor, at: 1, effectiveRange: nil)
//        let attributed = attributedString.attributedSubstring(from: NSRange(location: 2, length: 5))
        
        label.center = view.center
        label.textAlignment = .center
        view.addSubview(label)
        
    }


}

