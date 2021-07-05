//
//  Helicopter.swift
//  dz7
//
//  Created by Ivan Klishevich on 05.07.2021.
//

import Foundation

class Helicopter: Transport {
    override init(speed: Float, capacity: Int, costKm: Float) {
        super.init(speed: speed, capacity: capacity, costKm: costKm)
    }
    
    override func transportation(where amountPassengers: Int, and km: Float) {
        let time = km / self.speed
        let cost = self.costKm * km
        let amountTransport = Double(amountPassengers) / Double(self.capacity)
        
        print("Information about tranportation\nTime - \(time)\nCost - \(cost) $\nAmount helicopters - \(amountTransport.rounded())___\n")
    }
}
