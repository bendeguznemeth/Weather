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
    
    static func usecase() -> String {
        return "weatherdetail"
    }
    
    static func openUrl(_ url: URL, parameters: [String : AnyObject]?, completion: NavigationCallback?) -> Bool {
        guard let cityTag = url.queryParameterForKey(kCityTag) else {
            return false
        }
        
        
    }
    
    static func url(with cityTag: String) -> URL {
        return buildURLWithPath(nil, parameters: [kCityTag: cityTag])
    }
}
