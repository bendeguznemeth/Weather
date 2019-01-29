//
//  Navigator.swift
//  Weather
//
//  Created by Németh Bendegúz on 2019. 01. 25..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import Foundation

protocol Navigating {
    func openUrl(_ url: URL)
    func openUrl(_ url: URL, parameters: [String:AnyObject]?, completion: NavigationCallback?)
}

class Navigator: Navigating {
    
    func openUrl(_ url: URL) {
        self.doOpenUrl(url: url)
    }
    
    func openUrl(_ url: URL, parameters: [String : AnyObject]?, completion: NavigationCallback?) {
        self.doOpenUrl(url: url, parameters: parameters, completion: completion)
    }
    
    func doOpenUrl(url: URL, parameters: [String:AnyObject]? = nil, completion: NavigationCallback? = nil) {
        
        var canOpenUrl = false
        let useCase = url.host ?? ""
        
        switch useCase {
        case OverviewNavigator.usecase():
            canOpenUrl = OverviewNavigator.openUrl(url, parameters: parameters, completion: completion)
        case WeatherNavigator.usecase():
            canOpenUrl = WeatherNavigator.openUrl(url, parameters: parameters, completion: completion)
        default:
            canOpenUrl = false
        }
        
        if !canOpenUrl {
            fallBack()
        }
    }
    
    private func fallBack() {
        self.openUrl(OverviewNavigator.url())
    }
    
    static func url() -> URL {
        var components = URLComponents()
        components.scheme = URLBuilder.scheme
        components.host = ""
        
        guard let url = components.url else {
            return URL(string: "weather://")!
        }
        
        return url
    }
}
