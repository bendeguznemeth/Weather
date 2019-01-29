//
//  WeatherDetailFactory.swift
//  Weather
//
//  Created by Németh Bendegúz on 2019. 01. 25..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import UIKit

struct WeatherDetailParams {
    let cityTag: String
}

extension UseCaseFactory {
    
    static func createWeatherDetailVC( with params: WeatherDetailParams) -> WeatherDetailViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let weatherDetailViewController = storyboard.instantiateViewController(withIdentifier: "WeatherDetailViewController") as? WeatherDetailViewController else {
            fatalError("WeatherDetailViewController cannot be instantiated")
        }
        
        let weatherDetailInteractor = WeatherDetailInteractor(cityTag: params.cityTag)
        
        let weatherDetailPresenter = WeatherDetailPresenter(view: weatherDetailViewController, interactor: weatherDetailInteractor)
        
        weatherDetailInteractor.presenter = weatherDetailPresenter
        weatherDetailViewController.presenter = weatherDetailPresenter
        
        return weatherDetailViewController
    }
}
