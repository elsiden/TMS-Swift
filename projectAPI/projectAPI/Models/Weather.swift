//
//  Weather.swift
//  projectAPI
//
//  Created by Ivan Klishevich on 19.10.2021.
//

import UIKit

class Weather {
    var cityName: String
    var arrayOfDescriptionWeather: [WeatherDescription]
    var currentTemperature: Double
    var feelsTemperature: Double
    var pressure: Int
    var humidity: Int
    var maxTemperature: Double
    var minTemperature: Double
    var windSpeed: Double
    var windDirection: Int
    var sunset: Date
    var sunrise: Date

    init(cityName: String, arrayOfDescriptionWeather: [WeatherDescription], currentTemperature: Double,
         feelsTemperature: Double, pressure: Int,
         humidity: Int, maxTemperature: Double,
         minTemperature: Double, windSpeed: Double,
         windDirection: Int, sunset: Date,
         sunrise: Date) {
        self.cityName = cityName
        self.arrayOfDescriptionWeather = arrayOfDescriptionWeather
        self.currentTemperature = currentTemperature
        self.feelsTemperature = feelsTemperature
        self.pressure = pressure
        self.humidity = humidity
        self.maxTemperature = maxTemperature
        self.minTemperature = minTemperature
        self.windSpeed = windSpeed
        self.windDirection = windDirection
        self.sunset = sunset
        self.sunrise = sunrise
    }
}
