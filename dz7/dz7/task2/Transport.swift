//
//  Transport.swift
//  dz7
//
//  Created by Ivan Klishevich on 04.07.2021.
//

import Foundation

class Transport {
    var speed: Float
    var capacity: Int
    var costKm: Float
    
    init(speed: Float, capacity: Int, costKm: Float) {
        self.speed = speed
        self.capacity = capacity
        self.costKm = costKm
    }
    
    func transportation(where amountPassengers: Int, and km: Float) {
        print("Find transport to move \(amountPassengers) passengers on \(km) km")
    }
}
