//
//  Painter.swift
//  dz7
//
//  Created by Ivan Klishevich on 04.07.2021.
//

import Foundation

class Painter: Artist {
    override init(name: String, surname: String){
        super.init(name: "Mr. " + name, surname: "Incredible")
    }
    
    override func presentation() {
        infoArtist()
        print("Painter presentation___\n")
    }
}
