//
//  Checkers+KingMove.swift
//  CheckersProject
//
//  Created by Ivan Klishevich on 03.11.2021.
//

import UIKit

extension Checkers {
    func possibleStepsForUpperLeftKing(tag: Int) {
        let end: [Int] = [1, 2, 3, 4, 5, 13, 21, 29]
        var newTag: Int = 0
        for value in end {
            if value == tag {
                return
            }
        }
        
        let row = tag % 4 == 0 ? tag / 4 - 1 : tag / 4
        if row % 2 == 0 {
            newTag = tag - 4
        } else {
            newTag = tag - 5
        }

        possibleSteps.append(newTag)
        if !checkToEmptyCellKing(where: newTag) {
            possibleStepsForUpperLeftKing(tag: newTag)
        } else {
            return
        }
    }
    
    func possibleStepsForUpperRightKing(tag: Int) {
        let end: [Int] = [1, 2, 3, 4, 12, 20, 28]
        var newTag: Int = 0
        for value in end {
            if value == tag {
                return
            }
        }
        
        let row = tag % 4 == 0 ? tag / 4 - 1 : tag / 4
        if row % 2 == 0 {
            newTag = tag - 3
        } else {
            newTag = tag - 4
        }
        
        possibleSteps.append(newTag)
        if !checkToEmptyCellKing(where: newTag) {
            possibleStepsForUpperRightKing(tag: newTag)
        } else {
            return
        }
    }
    
    func possibleStepsForLowerLeftKing(tag: Int) {
        let end: [Int] = [5, 13, 21, 29, 30, 31, 32]
        var newTag: Int = 0
        for value in end {
            if value == tag {
                return
            }
        }

        let row = tag % 4 == 0 ? tag / 4 - 1 : tag / 4
        if row % 2 == 0 {
            newTag = tag + 4
        } else {
            newTag = tag + 3
        }
        
        possibleSteps.append(newTag)
        if !checkToEmptyCellKing(where: newTag) {
            possibleStepsForLowerLeftKing(tag: newTag)
        } else {
            return
        }
    }
    
    func possibleStepsForLowerRightKing(tag: Int) {
        let end: [Int] = [4, 12, 20, 28, 29, 30, 31, 32]
        var newTag: Int = 0
        for value in end {
            if value == tag {
                return
            }
        }

        let row = tag % 4 == 0 ? tag / 4 - 1 : tag / 4
        if row % 2 == 0 {
            newTag = tag + 5
        } else {
            newTag = tag + 4
        }
        
        possibleSteps.append(newTag)
        if !checkToEmptyCellKing(where: newTag) {
            possibleStepsForLowerRightKing(tag: newTag)
        } else {
            return
        }
    }
    
    func checkToEmptyCellKing(where newTag: Int) -> Bool {
        var check: Bool = false
        chessboard.subviews.forEach { cell in
            if cell.tag == newTag {
                if !cell.subviews.isEmpty {
                    check = true
                    return
                } else { return }
            }
        }
        return check
    }
    
    func fillDynamicKingCheckers() { // заполнение массива с дамочными передвижениями шашек
        chessboard.subviews.forEach { cell in
            if !cell.subviews.isEmpty {
                cell.subviews.forEach { checker in
                    for value in kingCheckers {
                        if whoStep == .white {
                            if value == checker.tag && value >= 12 && value <= 23 {
                                possibleStepsForUpperLeftKing(tag: cell.tag)
                                possibleStepsForUpperRightKing(tag: cell.tag)
                                possibleStepsForLowerLeftKing(tag: cell.tag)
                                possibleStepsForLowerRightKing(tag: cell.tag)
                                dynamicKingChecker.append([possibleSteps, checker.tag])
                                possibleSteps.removeAll()
                                break
                            }
                        } else {
                            if value == checker.tag && value >= 0 && value <= 11 {
                                possibleStepsForUpperLeftKing(tag: cell.tag)
                                possibleStepsForUpperRightKing(tag: cell.tag)
                                possibleStepsForLowerLeftKing(tag: cell.tag)
                                possibleStepsForLowerRightKing(tag: cell.tag)
                                dynamicKingChecker.append([possibleSteps, checker.tag])
                                possibleSteps.removeAll()
                                break
                            }
                        }
                    }
                }
            }
        }
    }
    
    func fillBeatKingPositions() { // заполнение kingBeatPositions (клетки в которых стоят вражеские шашки для дамок)
        let steps: [Int]
        if whoStep == .white {
            steps = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
        } else {
            steps = [12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]
        }
        
        cellAndChecker.forEach { stat in
            for checker in steps {
                if stat.checkerTag == checker {
                    dynamicKingChecker.forEach { dyn in
                        for cell in dyn[0] as! [Int] {
                            if cell == stat.cellTag {
                                kingBeatPositions.append([cell, dyn[1] as! Int])
                            }
                        }
                    }
                }
            }
        }
    }
    
    func fillKingBeatSteps() { // заполнение массива с возможными ходами и битьем вражеских шашек
        for value in kingBeatPositions {
            possibleSteps.removeAll()
            possibleStepsWhenBeat(tag: value[0]) // получение возможных конечных точек при битье вражеской шашки
            guard let start = cellAndChecker.first(where: {$0.checkerTag == value[1]})?.cellTag else { return } // начальная клетка выбранной шашки
            
            if possibleSteps.isEmpty {
                continue
            } else {
                if start > value[0] {
                    possibleSteps = possibleSteps.filter { $0 < value[0] }
                } else if start < value[0] {
                    possibleSteps = possibleSteps.filter { $0 > value[0] }
                }
                
                possibleStepsBeatKing(start: start, possSt: possibleSteps, enemyCell: value[0], chkTag: value[1])
            }
        }
        
        kingBeatSteps = kingBeatSteps.filter() {
            let cellBeat = $0[2]
            var contains: Bool = false
            chessboard.subviews.forEach { cell in
                if cell.tag != 0 && !contains {
                    for possSt in cellBeat as! Array<Int> {
                        if cell.tag == possSt {
                            if cell.subviews.isEmpty {
                                contains = true
                                break
                            } else {
                                contains = false
                            }
                        }
                    }
                }
            }
            return contains
        }
        
        var count: Int = 0
        for value in kingBeatSteps {
            var cellBeat = value[2] as! Array<Int>
            var contains: Bool = false
            cellBeat = cellBeat.filter { curCell in
                contains = false
                chessboard.subviews.forEach { cell in
                    if cell.tag != 0 && cell.tag == curCell {
                        if cell.subviews.isEmpty {
                            contains = true
                        }
                        return
                    }
                }
                return contains
            }
            kingBeatSteps[count][2] = cellBeat
            count += 1
        }
//        print(kingBeatSteps)
    }
    
    func possibleStepsBeatKing(start: Int, possSt: [Int], enemyCell: Int, chkTag: Int) {
        possibleSteps.removeAll()
        
        possibleStepsForUpperLeftKing(tag: enemyCell)
        possibleStepsForLowerRightKing(tag: enemyCell)
        
        var count: Int
        count = checkPossibleSteps(where: possSt, start: start, enemyCell: enemyCell)
        
        if count != 2 {
            count = 0
            possibleSteps.removeAll()
            
            possibleStepsForUpperRightKing(tag: enemyCell)
            possibleStepsForLowerLeftKing(tag: enemyCell)
            
            count = checkPossibleSteps(where: possSt, start: start, enemyCell: enemyCell)
        }
        
        kingBeatSteps.append([chkTag, start, possibleSteps, enemyCell])
        possibleSteps.removeAll()
    }
    
    func filterForDoubleStepKing(where checkerTag: Int) -> [[Any]] {
        return kingBeatSteps.filter { value in
            if value[0] as! Int == checkerTag {
                return true
            } else {
                return false
            }
        }
    }
    
    func checkPossibleSteps(where possSt: [Int], start: Int, enemyCell: Int) -> Int {
        var count: Int = 0
        
        for cell in possSt {
            if count == 2 {
                break
            } else {
                count = 0
            }
            for match in possibleSteps {
                if match == cell || match == start {
                    count += 1
                }
                if count == 2 {
                    if start > enemyCell {
                        possibleSteps = possibleSteps.filter { $0 < enemyCell }
                    } else if start < enemyCell {
                        possibleSteps = possibleSteps.filter { $0 > enemyCell }
                    }
                    break
                }
            }
        }
        return count
    }
}
