//
//  ThemeCollectionViewCell.swift
//  CheckersProject
//
//  Created by Ivan Klishevich on 21.08.2021.
//

import UIKit

class ThemeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var bgTheme: UIImageView!
    @IBOutlet weak var cellsTheme: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(where setting: Theme) {
        bgTheme.image = UIImage(named: setting.themeTitle)
        cellsTheme.image = UIImage(named: setting.cellsTitle)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        bgTheme.image = UIImage(named: "")
        cellsTheme.image = UIImage(named: "")
    }
}
