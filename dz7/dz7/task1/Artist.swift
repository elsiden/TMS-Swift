//
//  Artist.swift
//  dz7
//
//  Created by Ivan Klishevich on 04.07.2021.
//

import Foundation

class Artist {
    var name: String
    var surname: String
    
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
    }
    
    func presentation() {
        infoArtist()
        print("Common presentation (artist without qualifications)___\n")
    }
    
    func infoArtist() {
        print("\(self.name) \(self.surname)")
    }
    
    static func afisha(where afisha: [Artist]) {
        for value in afisha {
            value.presentation()
        }
    }
}
