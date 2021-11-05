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
    
    func possibleStepsWhenBeat(tag: Int) {
        switch tag {
        case 6, 7, 8, 14, 15, 16, 22, 23, 24:
            possibleSteps = [tag - 5, tag - 4, tag + 3, tag + 4]
        case 9, 10, 11, 17, 18, 19, 25, 26, 27:
            possibleSteps = [tag - 4, tag - 3, tag + 4, tag + 5]
        default: break
        }
    }
    
    func fillDynamicCheckers() { // заполнение массива с обычными передвижениями шашек с помощью possibleStepsForDynamic
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
        case 1, 2, 3:
            dynamicChecker.append([cellTag + 4, checkerTag])
            dynamicChecker.append([cellTag + 5, checkerTag])
        case 4:
            dynamicChecker.append([cellTag + 4, checkerTag])
        case 5, 12, 13, 20, 21, 28:
            dynamicChecker.append([cellTag + 4, checkerTag])
            dynamicChecker.append([cellTag - 4, checkerTag])
        case 6, 7, 8, 14, 15, 16, 22, 23, 24:
            dynamicChecker.append([cellTag - 5, checkerTag])
            dynamicChecker.append([cellTag - 4, checkerTag])
            dynamicChecker.append([cellTag + 3, checkerTag])
            dynamicChecker.append([cellTag + 4, checkerTag])
        case 9, 10, 11, 17, 18, 19, 25, 26, 27:
            dynamicChecker.append([cellTag - 4, checkerTag])
            dynamicChecker.append([cellTag - 3, checkerTag])
            dynamicChecker.append([cellTag + 4, checkerTag])
            dynamicChecker.append([cellTag + 5, checkerTag])
        case 29:
            dynamicChecker.append([cellTag - 4, checkerTag])
        case 30, 31, 32:
            dynamicChecker.append([cellTag - 4, checkerTag])
            dynamicChecker.append([cellTag - 5, checkerTag])
        break
        default: break
        }
    }
    
    func fillBeatPositions() { // заполнение beatPositions (клетки в которых стоят вражеские шашки)
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
    
    func fillBeatSteps() { // заполнение массива с возможными ходами и битьем вражеских шашек
        for value in beatPositions {
            possibleStepsWhenBeat(tag: value[0]) // получение возможных конечных точек при битье вражеской шашки
            guard let start = cellAndChecker.first(where: {$0.checkerTag == value[1]})?.cellTag else { return } // начальная клетка выбранной шашки
            
            if possibleSteps.isEmpty {
                continue
            } else {
                possibleStepsBeat(start: start, possSt: possibleSteps, enemyCell: value[0], chkTag: value[1])
            }
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
//        print(beatSteps)
    }
    
    func filterForDoubleStep(where checkerTag: Int) -> [[Int]] {
        return beatSteps.filter { value in
            if value[0] == checkerTag {
                return true
            } else {
                return false
            }
        }
    }
    
    func possibleStepsBeat(start: Int, possSt: [Int], enemyCell: Int, chkTag: Int) {
        var possStep: Int = -1
        
        switch start {
        case 1, 5:
            if start + 9 == possSt[0] {
                possStep = possSt[0]
            } else if start + 9 == possSt[1] {
                possStep = possSt[1]
            } else if start + 9 == possSt[2] {
                possStep = possSt[2]
            } else if start + 9 == possSt[3] {
                possStep = possSt[3]
            }
        case 2, 3, 6, 7:
            if start + 7 == possSt[0] || start + 9 == possSt[0] {
                possStep = possSt[0]
            } else if start + 7 == possSt[1] || start + 9 == possSt[1] {
                possStep = possSt[1]
            } else if start + 7 == possSt[2] || start + 9 == possSt[2] {
                possStep = possSt[2]
            } else if start + 7 == possSt[3] || start + 9 == possSt[3] {
                possStep = possSt[3]
            }
        case 4, 8:
            if start + 7 == possSt[0] {
                possStep = possSt[0]
            } else if start + 7 == possSt[1] {
                possStep = possSt[1]
            } else if start + 7 == possSt[2] {
                possStep = possSt[2]
            } else if start + 7 == possSt[3] {
                possStep = possSt[3]
            }
        case 9, 13, 17, 21:
            if start - 7 == possSt[0] || start + 9 == possSt[0] {
                possStep = possSt[0]
            } else if start - 7 == possSt[1] || start + 9 == possSt[1] {
                possStep = possSt[1]
            } else if start - 7 == possSt[2] || start + 9 == possSt[2] {
                possStep = possSt[2]
            } else if start - 7 == possSt[3] || start + 9 == possSt[3] {
                possStep = possSt[3]
            }
        case 10, 11, 14, 15, 18, 19, 22, 23:
            if start - 7 == possSt[0] || start + 9 == possSt[0] || start + 7 == possSt[0] || start - 9 == possSt[0] {
                possStep = possSt[0]
            } else if start - 7 == possSt[1] || start + 9 == possSt[1] || start + 7 == possSt[1] || start - 9 == possSt[1] {
                possStep = possSt[1]
            } else if start - 7 == possSt[2] || start + 9 == possSt[2] || start + 7 == possSt[2] || start - 9 == possSt[2] {
                possStep = possSt[2]
            } else if start - 7 == possSt[3] || start + 9 == possSt[3] || start + 7 == possSt[3] || start - 9 == possSt[3] {
                possStep = possSt[3]
            }
        case 12, 16, 20, 24:
            if start + 7 == possSt[0] || start - 9 == possSt[0] {
                possStep = possSt[0]
            } else if start + 7 == possSt[1] || start - 9 == possSt[1] {
                possStep = possSt[1]
            } else if start + 7 == possSt[2] || start - 9 == possSt[2] {
                possStep = possSt[2]
            } else if start + 7 == possSt[3] || start - 9 == possSt[3] {
                possStep = possSt[3]
            }
        case 25, 29:
            if start - 7 == possSt[0] {
                possStep = possSt[0]
            } else if start - 7 == possSt[1] {
                possStep = possSt[1]
            } else if start - 7 == possSt[2] {
                possStep = possSt[2]
            } else if start - 7 == possSt[3] {
                possStep = possSt[3]
            }
        case 26, 27, 30, 31:
            if start - 7 == possSt[0] || start - 9 == possSt[0] {
                possStep = possSt[0]
            } else if start - 7 == possSt[1] || start - 9 == possSt[1] {
                possStep = possSt[1]
            } else if start - 7 == possSt[2] || start - 9 == possSt[2] {
                possStep = possSt[2]
            } else if start - 7 == possSt[3] || start - 9 == possSt[3] {
                possStep = possSt[3]
            }
        case 28, 32:
            if start - 9 == possSt[0] {
                possStep = possSt[0]
            } else if start - 9 == possSt[1] {
                possStep = possSt[1]
            } else if start - 9 == possSt[2] {
                possStep = possSt[2]
            } else if start - 9 == possSt[3] {
                possStep = possSt[3]
            }
        default: break
        }
        
        if possStep != -1 {
            beatSteps.append([chkTag, start, possStep, enemyCell])
            possibleSteps.removeAll()
        } else {
            return
        }
    }
    
    func fillBeatsAction() {
        dynamicChecker.removeAll()
        beatPositions.removeAll()
        beatSteps.removeAll()
        dynamicKingChecker.removeAll()
        kingBeatPositions.removeAll()
        kingBeatSteps.removeAll()
        
        fillDynamicCheckers()
        fillBeatPositions()
        fillBeatSteps()
        if !kingCheckers.isEmpty {
            fillDynamicKingCheckers()
            if !dynamicKingChecker.isEmpty {
                fillBeatKingPositions()
                fillKingBeatSteps()
                deleteEqualFromBeatSteps()
            }
        }
    }
    
    func deleteEqualFromBeatSteps() {
        kingBeatSteps.forEach { king in
            beatSteps = beatSteps.filter({ basic in
                if king[0] as! Int == basic[0] {
                    return false
                } else { return true }
            })
        }
    }
}
