//
//  Checkers+SaveData.swift
//  CheckersProject
//
//  Created by Ivan Klishevich on 16.08.2021.
//

import UIKit

extension Checkers {
    func checkSaveFile() {
        createThemes()
        setupCollectionView()
        if FileManager().fileExists(atPath: URL.saveURL(pathComponent: KeysUserDefaults.theme.rawValue).path) {
            getTheme()
        }
        if FileManager().fileExists(atPath: URL.saveURL(pathComponent: KeysUserDefaults.saveBoard.rawValue).path) {
            setDataFromUserDefaults()
            getSavePositions()
            
            createGame()
            
            removeSavePositions()
            cellAndChecker.removeAll()
        } else {
            createGame()
        }
    }
    
    func saveDataToUserDefaults() {
        ud.setValue(whoStep.rawValue, forKey: KeysUserDefaults.whoStep.rawValue)
        ud.setValue(seconds, forKey: KeysUserDefaults.timerSec.rawValue)
    }
    
    func setDataFromUserDefaults() {
        whoStep = CheckersStep(rawValue: ud.integer(forKey: KeysUserDefaults.whoStep.rawValue)) ?? .white
        seconds = ud.integer(forKey: KeysUserDefaults.timerSec.rawValue)
    }
    
    func removeDataFromUserDefaults() {
        ud.removeObject(forKey: KeysUserDefaults.timerSec.rawValue)
        ud.removeObject(forKey: KeysUserDefaults.whoStep.rawValue)
    }
    
    func saveGamePositions() {
        chessboard.subviews.forEach { cell in
            if !cell.subviews.isEmpty {
                let position: CheckerInfo = CheckerInfo()
                position.cellTag = cell.tag
                cell.subviews.forEach { checker in
                    position.checkerTag = checker.tag
                }
                cellAndChecker.append(position)
            }
        }
        let data = try? NSKeyedArchiver.archivedData(withRootObject: cellAndChecker, requiringSecureCoding: true)
        try? data?.write(to: URL.saveURL(pathComponent: KeysUserDefaults.saveBoard.rawValue))
    }
    
    func getSavePositions() {
        guard let data = FileManager.default.contents(atPath: URL.saveURL(pathComponent:  KeysUserDefaults.saveBoard.rawValue).absoluteString.replacingOccurrences(of: "file://", with: "")),
              let object = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [CheckerInfo] else { return }
        self.cellAndChecker = object
    }
    
    func removeSavePositions() {
        do {
            try FileManager.default.removeItem(at: URL.saveURL(pathComponent: KeysUserDefaults.saveBoard.rawValue))
        } catch {
            print()
        }
    }
    
    func saveTheme() {
        let data = try? NSKeyedArchiver.archivedData(withRootObject: theme, requiringSecureCoding: true)
        try? data?.write(to: URL.saveURL(pathComponent: KeysUserDefaults.theme.rawValue))
    }
    
    func getTheme() {
        guard let data = FileManager.default.contents(atPath: URL.saveURL(pathComponent: KeysUserDefaults.theme.rawValue).absoluteString.replacingOccurrences(of: "file://", with: "")),
              let object = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Theme else { return }
        self.theme = object
    }
    
    private func setupCollectionView() {
        collectionTheme.dataSource = self
        collectionTheme.delegate = self
        collectionTheme.register(UINib(nibName: "ThemeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ThemeCollectionViewCell")
    }
}
