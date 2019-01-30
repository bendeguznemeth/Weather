//
//  WeatherDetailNavigator.swift
//  Weather
//
//  Created by Németh Bendegúz on 2019. 01. 25..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import Foundation

class WeatherDetailNavigator: Navigation {
    
    private static let kCityTag = "city_id"
    private static let kCityName = "cityName"
    
    static func usecase() -> String {
        return "weatherdetail"
    }
    
    static func openUrl(_ url: URL, parameters: [String : AnyObject]?, completion: NavigationCallback?) -> Bool {
        guard let cityTag = url.queryParameterForKey(kCityTag) else {
            return false
        }
        
        guard let cityName = url.queryParameterForKey(kCityName) else {
            return false
        }
        
        let weatherDetailParams = WeatherDetailParams.init(cityTag: cityTag, cityName: cityName)
        let weatherDetailViewController = UseCaseFactory.createWeatherDetailVC(with: weatherDetailParams)
        
        topNavigationController()?.pushViewController(weatherDetailViewController, animated: true)
        
        return true
    }
    
    static func url(cityTag: String, cityName: String) -> URL {
        return buildURLWithPath(nil, parameters: [kCityTag: cityTag, kCityName: cityName])
    }
}
