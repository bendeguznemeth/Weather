//
//  CitiesListNavigator.swift
//  Weather
//
//  Created by Németh Bendegúz on 2019. 01. 25..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import UIKit

class CitiesListNavigator: Navigation {
    
    static func usecase() -> String {
        return "citieslist"
    }
    
    static func openUrl(_ url: URL, parameters: [String : AnyObject]?, completion: NavigationCallback?) -> Bool {
        
        let citiesListParams = CitiesListParams()
        let viewController = UseCaseFactory.createCitiesListVC(with: citiesListParams)
        let rootViewController = UINavigationController(rootViewController: viewController)
        
        keyWindow().rootViewController = rootViewController
        
        return true
    }
}
