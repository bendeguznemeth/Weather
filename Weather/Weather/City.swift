//
//  City.swift
//  Weather
//
//  Created by Németh Bendegúz on 2019. 01. 11..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import Foundation

class City {
    
    let id: String
    let name: String
    let county: String?
    var weatherInfo: WeatherInfo?
    
    init(id: String, name: String, county: String?) {
        self.id = id
        self.name = name
        self.county = county
    }
}
