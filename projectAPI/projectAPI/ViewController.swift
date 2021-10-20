//
//  ViewController.swift
//  projectAPI
//
//  Created by Ivan Klishevich on 08.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var test1: UILabel!
    @IBOutlet weak var test2: UILabel!
    @IBOutlet weak var test3: UILabel!
    
    var currentCity: Weather?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityTextField.delegate = self
    }
    
    func getData(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let jsonWeather = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else { return }
            
            guard let cityName = jsonWeather["name"] as? String else { return }
            
            var arrayOfDescriptionWeather: [WeatherDescription] = []
            guard let weather = jsonWeather["weather"] as? [[String: Any]] else { return }
            for value in weather {
                guard let descriptionWeather = value["description"] as? String,
                      let iconWeather = value["icon"] as? String else { return }
                arrayOfDescriptionWeather.append(WeatherDescription(descriptionWeather: descriptionWeather, iconWeather: iconWeather))
            }
                  
            
            guard let sys = jsonWeather["sys"] as? [String: Any],
                  let sunset = sys["sunset"] as? Int,
                  let sunrise = sys["sunrise"] as? Int else { return }
            
            guard let main = jsonWeather["main"] as? [String: Any],
                  let feelsTemperature = main["feels_like"] as? Double,
                  let currentTemperature = main["temp"] as? Double,
                  let pressure = main["pressure"] as? Int,
                  let humidity = main["humidity"] as? Int,
                  let maxTemperature = main["temp_max"] as? Double,
                  let minTemperature = main["temp_min"] as? Double else { return }
            
            guard let wind = jsonWeather["wind"] as? [String: Any],
                  let windSpeed = wind["speed"] as? Double,
                  let windDirection = wind["deg"] as? Int else { return }

            self.currentCity = Weather(cityName: cityName, arrayOfDescriptionWeather: arrayOfDescriptionWeather,
                                       currentTemperature: currentTemperature,
                                       feelsTemperature: feelsTemperature, pressure: pressure,
                                       humidity: humidity, maxTemperature: maxTemperature,
                                       minTemperature: minTemperature, windSpeed: windSpeed,
                                       windDirection: windDirection, sunset: Date(timeIntervalSince1970: TimeInterval(sunset)),
                                       sunrise: Date(timeIntervalSince1970: TimeInterval(sunrise)))
        }
        session.resume()
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let city = cityTextField.text, !city.isEmpty else { return false }
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=016467d388062bf4c642b3df500e17d3"
        getData(urlString: urlString)
        test2.text = currentCity?.cityName
        
        return true
    }
}

