//
//  User.swift
//  tms16
//
//  Created by Ivan Klishevich on 05.08.2021.
//

import UIKit

class User {
    var name: String
    var avatar: UIImage
    var content: UIImage
    
    init(name: String, avatar: UIImage, content: UIImage) {
        self.name = name
        self.avatar = avatar
        self.content = content
    }
}
