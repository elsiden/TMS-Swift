//
//  Checkers+SaveData.swift
//  CheckersProject
//
//  Created by Ivan Klishevich on 16.08.2021.
//

import UIKit

extension Checkers {
    func checkSaveFile() {
        addNotificationBackground()
        createThemes()
        setupCollectionView()
        setupNamesOrTrain()
        
        if FileManager().fileExists(atPath: URL.saveURL(pathComponent: KeysUserDefaults.theme.rawValue).path) {
            getTheme()
        }
        view.addSubview(setBackground(where: theme.themeTitle))
        
        if FileManager().fileExists(atPath: URL.saveURL(pathComponent: KeysUserDefaults.saveBoard.rawValue).path) {
            setDataFromUserDefaults()
            getSavePositions()
            getNames()
            cornerRadiusForViews()
            createGameWithNames()
            createBeatSteps()
        } else {
            cornerRadiusForViews()
            createNamesAlert()
            setDate()
        }
    }
    
    func saveDataToUserDefaults() {
        ud.setValue(whoStep.rawValue, forKey: KeysUserDefaults.whoStep.rawValue)
        ud.setValue(seconds, forKey: KeysUserDefaults.timerSec.rawValue)
        ud.setValue(dataDate, forKey: KeysUserDefaults.startGameDate.rawValue)
    }
    
    func setDataFromUserDefaults() {
        whoStep = CheckersColor(rawValue: ud.integer(forKey: KeysUserDefaults.whoStep.rawValue)) ?? .white
        seconds = ud.integer(forKey: KeysUserDefaults.timerSec.rawValue)
        dataDate = ud.string(forKey: KeysUserDefaults.startGameDate.rawValue) ?? ""
    }
    
    func removeDataFromUserDefaults() {
        ud.removeObject(forKey: KeysUserDefaults.timerSec.rawValue)
        ud.removeObject(forKey: KeysUserDefaults.whoStep.rawValue)
        ud.removeObject(forKey: KeysUserDefaults.startGameDate.rawValue)
    }
    
    func saveGamePositions() {
        chessboard.subviews.forEach { cell in
            if !cell.subviews.isEmpty {
                let position: CheckerInfo = CheckerInfo()
                position.cellTag = cell.tag
                cell.subviews.forEach { checker in
                    position.checkerTag = checker.tag
                    position.kingChecker = 0
                }
                cellAndChecker.append(position)
            }
        }
        if !kingCheckers.isEmpty {
            findKingCheckers()
        }
        let data = try? NSKeyedArchiver.archivedData(withRootObject: cellAndChecker, requiringSecureCoding: true)
        try? data?.write(to: URL.saveURL(pathComponent: KeysUserDefaults.saveBoard.rawValue))
    }
    
    func cleanFileWithPositions() {
        do {
            try "".write(to: URL.saveURL(pathComponent: KeysUserDefaults.saveBoard.rawValue), atomically: true, encoding: .utf8)
        } catch {
            print()
        }
    }
    
    func getSavePositions() {
        guard let data = FileManager.default.contents(atPath: URL.saveURL(pathComponent:  KeysUserDefaults.saveBoard.rawValue).absoluteString.replacingOccurrences(of: "file://", with: "")),
              let object = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [CheckerInfo] else { return }
        self.cellAndChecker = object
        setKingCheckers()
    }
    
    func removeSavePositions() {
        do {
            try FileManager.default.removeItem(at: URL.saveURL(pathComponent: KeysUserDefaults.saveBoard.rawValue))
        } catch {
            print()
        }
    }
    
    func findKingCheckers() {
        kingCheckers.forEach { king in
            cellAndChecker.first { checker in
                guard king == checker.checkerTag else { return false }
                checker.kingChecker = 1
                return true
            }
        }
    }
    
    func setKingCheckers() {
        cellAndChecker.forEach { king in
            if king.kingChecker == 1 {
                kingCheckers.append(king.checkerTag ?? -1)
            }
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
        collectionTheme.themes = self.themes
        
        collectionTheme.changeFunc = { theme in
            self.changeTheme(theme: theme)
        }
    }
    
    private func setupNamesOrTrain() {
        playersNames.startTapped = {
            if self.playersNames.firstPlayerName.text?.isEmpty ?? true || self.playersNames.secondPlayerName.text?.isEmpty ?? true {
                self.playersNames.namesLabel.textColor = .red
            } else {
                self.playersNames.namesLabel.textColor = .black
                self.createPlayers()
                self.players[0].playerName = self.playersNames.firstPlayerName.text ?? "unnamed"
                self.players[1].playerName = self.playersNames.secondPlayerName.text ?? "unnamed"
                self.createGameWithNames()
                self.clearTextField(first: self.playersNames.firstPlayerName, second: self.playersNames.secondPlayerName)
                self.saveNames()
            }
        }
        playersNames.trainTapped = {
            self.createPlayers()
            self.players[1].playerStep = 1
            self.createGame()
            self.playersNames.namesLabel.textColor = .black
            self.clearTextField(first: self.playersNames.firstPlayerName, second: self.playersNames.secondPlayerName)
            self.saveNames()
        }
    }
    
    func saveNames() {
        let data = try? NSKeyedArchiver.archivedData(withRootObject: players, requiringSecureCoding: true)
        try? data?.write(to: URL.saveURL(pathComponent: KeysUserDefaults.players.rawValue))
    }
    
    func getNames() {
        guard let data = FileManager.default.contents(atPath: URL.saveURL(pathComponent: KeysUserDefaults.players.rawValue).absoluteString.replacingOccurrences(of: "file://", with: "")),
              let object = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Player] else { return }
        self.players = object
    }
}
