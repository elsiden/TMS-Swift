//
//  TableViewCell.swift
//  tms16
//
//  Created by Ivan Klishevich on 04.08.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var label_: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() { // вызывается при переиспользовании ячейки
        super.prepareForReuse()
        
        label_.text = ""
    }

}
