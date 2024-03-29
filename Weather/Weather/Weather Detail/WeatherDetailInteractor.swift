//
//  WeatherDetailInteractor.swift
//  Weather
//
//  Created by Németh Bendegúz on 2019. 01. 24..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

class WeatherDetailInteractor {
    
    weak var presenter: WeatherDetailPresenting?
    
    private let cityTag: String
    
    init(cityTag: String) {
        self.cityTag = cityTag
    }
    
    func load() {
        OpenWeatherAPI.getWeatherInfo(for: cityTag) { [weak self] (result) in
            guard let strongSelf = self else {
                return
            }
            
            switch result {
            case let .success(model):
                strongSelf.presenter?.onSuccess(with: model)
            case let .failure(error):
                strongSelf.presenter?.onError(with: error)
            }
        }
    }
    
}
