//
//  RGBClassCell.swift
//  dz16
//
//  Created by Ivan Klishevich on 05.08.2021.
//

import UIKit

class RGBClassCell: UITableViewCell {
    @IBOutlet weak var rgbClassLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setRGB(with value: ColorName) {
        rgbClassLabel.attributedText = NSAttributedString(string: value.colorName, attributes: [.foregroundColor: value.color])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        rgbClassLabel.text = ""
    }
    
}
