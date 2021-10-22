//
//  ViewController.swift
//  projectAPI
//
//  Created by Ivan Klishevich on 08.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var descriptionWeatherLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var feelsTemperatureLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var windDirectionLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    
    var currentWeather: Weather?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityTextField.delegate = self
        
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let city = self.cityTextField.text, !city.isEmpty else { return false }
        HTTPManager.shared.getWeather(where: city) { weather in
            self.currentWeather = weather
            
            guard self.currentWeather != nil else {
                return
            }

            DispatchQueue.main.async {
                guard let currentWeather = self.currentWeather else { return }

                self.cityNameLabel.text = currentWeather.cityName
                self.descriptionWeatherLabel.text = "\(currentWeather.arrayOfDescriptionWeather[0].descriptionWeather)"
                self.currentTemperatureLabel.text = "\(currentWeather.currentTemperature)"
                self.feelsTemperatureLabel.text = "\(currentWeather.feelsTemperature)"
                self.pressureLabel.text = "\(currentWeather.pressure)"
                self.humidityLabel.text = "\(currentWeather.humidity)"
                self.maxTemperatureLabel.text = "\(currentWeather.maxTemperature)"
                self.minTemperatureLabel.text = "\(currentWeather.minTemperature)"
                self.windSpeedLabel.text = "\(currentWeather.windSpeed)"
                self.windDirectionLabel.text = "\(currentWeather.windDirection)"
                self.sunsetLabel.text = "\(currentWeather.sunset)"
                self.sunriseLabel.text = "\(currentWeather.sunrise)"
                
                guard let url = URL(string: "http://openweathermap.org/img/wn/\(currentWeather.arrayOfDescriptionWeather[0].iconWeather)@2x.png"),
                      let data = try? Data(contentsOf: url) else { return }
                self.iconImage.image = UIImage(data: data)
            }
        }

        return true
    }
}

