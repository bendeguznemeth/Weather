//
//  WeatherDetailViewController.swift
//  Weather
//
//  Created by Németh Bendegúz on 2019. 01. 11..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {

    var city: City? {
        didSet {
            self.navigationItem.title = city?.name
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let cityID = city?.id else {
            fatalError("WeatherDetailViewController do not have a city")
        }
        
        OpenWeatherAPI.getWeatherInfo(for: cityID) { (weatherInfo) in
            
            print("Result:")
            print("\(weatherInfo.main)")
            print("\(weatherInfo.description)")
            print("\(weatherInfo.temperature)")
            print("\(weatherInfo.pressure)")
            print("\(weatherInfo.humidity)")
            
        }
    }
    
}
