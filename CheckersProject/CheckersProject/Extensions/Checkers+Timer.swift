//
//  Checkers+Timer.swift
//  CheckersProject
//
//  Created by Ivan Klishevich on 13.08.2021.
//

import UIKit

extension Checkers {
    func createTimer() {
        let size = view.bounds.size.width / 2 + 10
        timerLabel = UILabel(frame: CGRect(x: view.bounds.size.width, y: 0, width: 115, height: 75))

        let attrs: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white, .font: UIFont.dited(with: 45.0)]
        timerLabel.attributedText = NSAttributedString(string: timerString(), attributes: attrs)
        timerLabel.center.y = view.center.y - size
        view.addSubview(timerLabel)
    }
    
    func startTimer() {
        timer = Timer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
    }
    
    func stopTimer() {
        timer?.invalidate()
    }
    
    @objc func timerFunc() {
        seconds += 1
        timerLabel.text = timerString()
    }
    
    @objc func timerString() -> String {
//        let hours = seconds / 3600 > 9 ? "\(seconds / 3600)" : "0\(seconds / 3600)"
        let minutes = (seconds % 3600) / 60 > 9 ? "\((seconds % 3600) / 60)" : "0\((seconds % 3600) / 60)"
        let seconds = (seconds % 3600) % 60 > 9 ? "\((seconds % 3600) % 60)" : "0\((seconds % 3600) % 60)"
        return minutes + " : " + seconds
//        return hours + minutes + seconds
    }
}
