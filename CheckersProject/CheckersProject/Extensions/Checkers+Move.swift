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
    
    func fillDynamicCheckers() {
        let steps: [Int]
        if whoStep == .white {
            steps = [12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]
        } else {
            steps = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
        }
        
        chessboard.subviews.forEach { cell in
            if !cell.subviews.isEmpty {
                cell.subviews.forEach { checker in
                    for value in steps {
                        if value == checker.tag {
                            possibleStepsForDynamic(cellTag: cell.tag, checkerTag: checker.tag)
                            break
                        }
                    }
                }
            }
        }
    }
    
    func possibleStepsForDynamic(cellTag: Int, checkerTag: Int) {
        switch cellTag {
        case 4, 5, 12, 13, 20, 21, 28, 29:
            dynamicChecker.append(whoStep == .white ? [cellTag - 4, checkerTag] : [cellTag + 4, checkerTag])
        case 1, 2, 3:
            dynamicChecker.append([cellTag + 4, checkerTag])
            dynamicChecker.append([cellTag + 5, checkerTag])
        case 30, 31, 32:
            dynamicChecker.append([cellTag - 4, checkerTag])
            dynamicChecker.append([cellTag - 5, checkerTag])
        default:
            let row = cellTag % 4 == 0 ? cellTag / 4 - 1 : cellTag / 4
            if row % 2 == 0 {
                dynamicChecker.append(whoStep == .white ? [cellTag - 4, checkerTag] : [cellTag + 4, checkerTag])
                dynamicChecker.append(whoStep == .white ? [cellTag - 3, checkerTag] : [cellTag + 5, checkerTag])
            } else {
                dynamicChecker.append(whoStep == .white ? [cellTag - 5, checkerTag] : [cellTag + 3, checkerTag])
                dynamicChecker.append(whoStep == .white ? [cellTag - 4, checkerTag] : [cellTag + 4, checkerTag])
            }
        }
    }
    
    func fillBeatPositions() {
        let steps: [Int]
        if whoStep == .white {
            steps = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
        } else {
            steps = [12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]
        }
        
        cellAndChecker.forEach { stat in
            for value in steps {
                if stat.checkerTag == value {
                    dynamicChecker.forEach { dyn in
                        if stat.cellTag == dyn[0] {
                            beatPositions.append(dyn)
                        }
                    }
                }
            }
        }
    }
    
    func fillBeatSteps() {
        for value in beatPositions {
            possibleSteps(tag: value[0])
            guard let start = cellAndChecker.first(where: {$0.checkerTag == value[1]})?.cellTag else { return }
            
            checkPossibleSteps(start: start, possSt: possibleSteps, enemyCell: value[0], chkTag: value[1])
        }
        
        beatSteps = beatSteps.filter() {
            let cellBeat = $0[2]
            var contains: Bool = false
            chessboard.subviews.forEach { cell in
                if cellBeat == cell.tag {
                    if cell.subviews.isEmpty {
                        contains = true
                    } else {
                        contains = false
                    }
                }
            }
            return contains
        }
        
    }
    
    func checkPossibleSteps(start: Int, possSt: [Int], enemyCell: Int, chkTag: Int) {
        if whoStep == .white {
            possibleStepsBeatWhite(start: start, possSt: possSt, enemyCell: enemyCell, chkTag: chkTag)
        } else {
            possibleStepsBeatBlack(start: start, possSt: possSt, enemyCell: enemyCell, chkTag: chkTag)
        }
    }
    
    func possibleStepsBeatBlack(start: Int, possSt: [Int], enemyCell: Int, chkTag: Int) {
        //только для черных
        var possStep: Int = -1
        
        switch start {
        case 1, 5, 9, 13, 17, 21:
            if start + 9 == possSt[0] {
                possStep = possSt[0]
            } else if start + 9 == possSt[1] {
                possStep = possSt[1]
            }
        case 2, 3, 6, 7, 10, 11, 14, 15, 18, 19, 22, 23:
            if start + 7 == possSt[0] || start + 9 == possSt[0] {
                possStep = possSt[0]
            } else if start + 7 == possSt[1] || start + 9 == possSt[1] {
                possStep = possSt[1]
            }
        case 4, 8, 12, 16, 20, 24:
            if start + 7 == possSt[0] {
                possStep = possSt[0]
            } else if start + 7 == possSt[1] {
                possStep = possSt[1]
            }
        default:
            break
        }
        
        if possStep != -1 {
            beatSteps.append([chkTag, start, possStep, enemyCell])
            possibleSteps.removeAll()
        } else {
            return
        }
    }
    
    func possibleStepsBeatWhite(start: Int, possSt: [Int], enemyCell: Int, chkTag: Int) {
        //только для белых
        var possStep: Int = -1
        
        switch start {
        case 32, 28, 24, 20, 16, 12:
            if start - 9 == possSt[0] {
                possStep = possSt[0]
            } else if start - 9 == possSt[1] {
                possStep = possSt[1]
            }
        case 31, 30, 27, 26, 23, 22, 19, 18, 15, 14, 11, 10:
            if start - 7 == possSt[0] || start - 9 == possSt[0] {
                possStep = possSt[0]
            } else if start - 7 == possSt[1] || start - 9 == possSt[1] {
                possStep = possSt[1]
            }
        case 29, 25, 21, 17, 13, 9:
            if start - 7 == possSt[0] {
                possStep = possSt[0]
            } else if start - 7 == possSt[1] {
                possStep = possSt[1]
            }
        default:
            break
        }
        
        if possStep != -1 {
            beatSteps.append([chkTag, start, possStep, enemyCell])
            possibleSteps.removeAll()
        } else {
            return
        }
    }
}
