//
//  CustomPlayersNameAlert.swift
//  CheckersProject
//
//  Created by Ivan Klishevich on 05.09.2021.
//

import UIKit

@IBDesignable
class CustomPlayersNameAlert: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var firstPlayerName: UITextField!
    @IBOutlet weak var secondPlayerName: UITextField!
    @IBOutlet weak var namesLabel: UILabel!
    
    var startTapped: (() -> ())? = nil
    var trainTapped: (() -> ())? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        Bundle(for: CustomPlayersNameAlert.self).loadNibNamed("CustomPlayersNameAlert", owner: self, options: nil)
        contentView.frame = self.bounds
        self.addSubview(contentView)
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        startTapped?()
    }
    
    @IBAction func trainButton(_ sender: UIButton) {
        trainTapped?()
    }
    
}
