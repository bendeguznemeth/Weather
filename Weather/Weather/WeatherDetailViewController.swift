//
//  WeatherDetailViewController.swift
//  Weather
//
//  Created by Németh Bendegúz on 2019. 01. 11..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var pressureLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var city: City? {
        didSet {
            self.navigationItem.title = city?.name
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.displayWeatherInfo()

        guard let cityID = city?.id else {
            fatalError("WeatherDetailViewController do not have a city")
        }
        
        OpenWeatherAPI.getWeatherInfo(for: cityID) { (weatherInfo) in
            self.city?.weatherInfo = weatherInfo
            self.displayWeatherInfo()
        }
    }
    
    private func displayWeatherInfo() {
        if let weatherInfo = self.city?.weatherInfo {
            self.mainLabel.text = weatherInfo.main
            self.descriptionLabel.text = weatherInfo.description
            self.temperatureLabel.text = "\(Int(weatherInfo.temperature)) °C"
            self.pressureLabel.text = "\(Int(weatherInfo.pressure)) hpa"
            self.humidityLabel.text = "\(Int(weatherInfo.humidity)) %"
            
            self.activityIndicator.stopAnimating()
        }
    }
}
