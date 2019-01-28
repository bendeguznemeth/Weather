//
//  WeatherDetailPresenting.swift
//  Weather
//
//  Created by Németh Bendegúz on 2019. 01. 24..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

protocol WeatherDetailPresenting: class {
    
    func onError(with error: Error)
    
    func onSuccess(with model: WeatherDetailModel)
    
}
