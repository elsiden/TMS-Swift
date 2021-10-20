//
//  WeatherDescription.swift
//  projectAPI
//
//  Created by Ivan Klishevich on 20.10.2021.
//

import UIKit

class WeatherDescription {
    var descriptionWeather: String
    var iconWeather: String
    
    init(descriptionWeather: String, iconWeather: String) {
        self.descriptionWeather = descriptionWeather
        self.iconWeather = iconWeather
    }
}
