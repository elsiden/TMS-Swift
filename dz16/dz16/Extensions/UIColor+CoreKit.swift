//
//  File.swift
//  dz16
//
//  Created by Ivan Klishevich on 05.08.2021.
//

import UIKit

//extension UIColor {
//    func setColorRGBWhere(red: Int, green: Int, blue: Int, alpha: Int = 1) {
//
//    }
//}

extension UIColor {
    var coreImageColor: CIColor {
        return CIColor(color: self)
    }
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        let coreImageColor = self.coreImageColor
        return (coreImageColor.red, coreImageColor.green, coreImageColor.blue, coreImageColor.alpha)
    }
//    func setColorRGB() -> UIColor {
//        return UIColor(red: .random(in: 0...255) / 255, green: .random(in: 0...255) / 255, blue: .random(in: 0...255) / 255, alpha: 1)
//    }
}
