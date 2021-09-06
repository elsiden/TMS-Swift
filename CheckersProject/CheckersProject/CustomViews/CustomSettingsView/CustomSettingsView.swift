//
//  CustomSettingsView.swift
//  CheckersProject
//
//  Created by Ivan Klishevich on 30.08.2021.
//

import UIKit

@IBDesignable
class CustomSettingsView: UIView {
    @IBOutlet weak var collectionTheme: UICollectionView!
    @IBOutlet weak var timerSwitch: UISwitch!
    @IBOutlet var contentView: UIView!
    
    var themes: [Theme] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        Bundle(for: CustomSettingsView.self).loadNibNamed("CustomSettingsView", owner: self, options: nil)
        contentView.frame = self.bounds
        self.addSubview(contentView)
        
        collectionTheme.dataSource = self
        collectionTheme.delegate = self
        collectionTheme.register(UINib(nibName: "ThemeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ThemeCollectionViewCell")
    }
    
    var changeFunc: ((Theme) -> ())? = nil
}
