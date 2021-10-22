//
//  ParseManager.swift
//  projectAPI
//
//  Created by Ivan Klishevich on 22.10.2021.
//

import UIKit

class ParseManager {
    static let shared = ParseManager()
    
    func getParseData(where data: Data) -> Weather? {
        guard let jsonWeather = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else { return nil }
        
        guard let cityName = jsonWeather["name"] as? String else { return nil }
        
        var arrayOfDescriptionWeather: [WeatherDescription] = []
        guard let weather = jsonWeather["weather"] as? [[String: Any]] else { return nil }
        for value in weather {
            guard let descriptionWeather = value["description"] as? String,
                  let iconWeather = value["icon"] as? String else { return nil }
            arrayOfDescriptionWeather.append(WeatherDescription(descriptionWeather: descriptionWeather, iconWeather: iconWeather))
        }
              
        
        guard let sys = jsonWeather["sys"] as? [String: Any],
              let sunset = sys["sunset"] as? Int,
              let sunrise = sys["sunrise"] as? Int else { return nil }
        
        guard let main = jsonWeather["main"] as? [String: Any],
              let feelsTemperature = main["feels_like"] as? Double,
              let currentTemperature = main["temp"] as? Double,
              let pressure = main["pressure"] as? Int,
              let humidity = main["humidity"] as? Int,
              let maxTemperature = main["temp_max"] as? Double,
              let minTemperature = main["temp_min"] as? Double else { return nil }
        
        guard let wind = jsonWeather["wind"] as? [String: Any],
              let windSpeed = wind["speed"] as? Double,
              let windDirection = wind["deg"] as? Int else { return nil }

        return Weather(cityName: cityName, arrayOfDescriptionWeather: arrayOfDescriptionWeather,
                                   currentTemperature: currentTemperature,
                                   feelsTemperature: feelsTemperature, pressure: pressure,
                                   humidity: humidity, maxTemperature: maxTemperature,
                                   minTemperature: minTemperature, windSpeed: windSpeed,
                                   windDirection: windDirection, sunset: Date(timeIntervalSince1970: TimeInterval(sunset)),
                                   sunrise: Date(timeIntervalSince1970: TimeInterval(sunrise)))
    }
}
