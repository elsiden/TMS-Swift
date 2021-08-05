//
//  RGBTableViewCell.swift
//  dz16
//
//  Created by Ivan Klishevich on 05.08.2021.
//

import UIKit

class RGBTableViewCell: UITableViewCell {
    @IBOutlet weak var rgbLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        rgbLabel.text = ""
    }
}
