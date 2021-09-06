//
//  Checkers+Move.swift
//  CheckersProject
//
//  Created by Ivan Klishevich on 30.08.2021.
//

import UIKit

extension Checkers {
    func possibleSteps(tag: Int) {
        switch tag {
        case 4, 5, 12, 13, 20, 21, 28, 29:
            possibleSteps = whoStep == .white ? [tag - 4, tag - 4] : [tag + 4, tag + 4]
        case 1, 2, 3:
            possibleSteps = [tag + 4, tag + 5]
        case 30, 31, 32:
            possibleSteps = [tag - 4, tag - 5]
        default:
            let row = tag % 4 == 0 ? tag / 4 - 1 : tag / 4
            if row % 2 == 0 {
                possibleSteps = whoStep == .white ? [tag - 4, tag - 3] : [tag + 4, tag + 5]
            } else {
                possibleSteps = whoStep == .white ? [tag - 5, tag - 4] : [tag + 3, tag + 4]
            }
        }
    }
}
