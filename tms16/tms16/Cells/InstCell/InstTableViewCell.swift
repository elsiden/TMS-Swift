//
//  InstTableViewCell.swift
//  tms16
//
//  Created by Ivan Klishevich on 04.08.2021.
//

import UIKit

class InstTableViewCell: UITableViewCell {
    @IBOutlet weak var dotsImageView: UIImageView!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        dotsImageView.image = dotsImageView.image?.withRenderingMode(.alwaysTemplate)
        dotsImageView.tintColor = .black
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(with user: User) {
        nameLabel.text = user.name
        avatar.image = user.avatar
        contentImageView.image = user.content
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        
        nameLabel.text = ""
        avatar.image = nil
        contentImageView.image = nil
    }
    
}
