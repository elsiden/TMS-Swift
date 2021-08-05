//
//  StudentsTableCell.swift
//  dz16
//
//  Created by Ivan Klishevich on 05.08.2021.
//

import UIKit

class StudentsTableCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avgMarkLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(with student: Student) {
        nameLabel.text = student.fullName
        avgMarkLabel.text = String(format: "%.2f", student.avgMark)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        nameLabel.text = ""
        avgMarkLabel.text = ""
        contentView.backgroundColor = .clear
    }
    
}
