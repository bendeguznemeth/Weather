//
//  CitiesListModel.swift
//  Weather
//
//  Created by Németh Bendegúz on 2019. 01. 24..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

struct CitiesListModel {
    
    let cityModels: [CityModel]
    
    struct CityModel {
        let cityID: String
        let name: String
        let county: String?
    }
    
}
