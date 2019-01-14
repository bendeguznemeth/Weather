//
//  City.swift
//  Weather
//
//  Created by Németh Bendegúz on 2019. 01. 11..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import Foundation

class City {
    
    let name: String
    let county: String?
    var weatherInfo: WeatherInfo?
    
    init(name: String, county: String?) {
        self.name = name
        self.county = county
    }
}
