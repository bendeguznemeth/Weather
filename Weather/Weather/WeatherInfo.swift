//
//  WeatherInfo.swift
//  Weather
//
//  Created by Németh Bendegúz on 2019. 01. 12..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import Foundation

class WeatherInfo {
    
    var main: String
    var description: String
    var temperature: Double
    var pressure: Double
    var humidity: Double
    
    
    init(main: String, description: String, temperature: Double, pressure: Double, humidity: Double) {
        self.main = main
        self.description = description
        self.temperature = temperature
        self.pressure = pressure
        self.humidity = humidity
    }
}
