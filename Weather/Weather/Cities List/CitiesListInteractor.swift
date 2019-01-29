//
//  CitiesListInteractor.swift
//  Weather
//
//  Created by Németh Bendegúz on 2019. 01. 24..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

class CitiesListInteractor {
    
    weak var presenter: CitiesListPresenting?
    
    private let cities = CitiesListModel.init(cityModels: [CitiesListModel.CityModel.init(cityTag: "Sopron", name: "Sopron", county: "Győr-Moson-Sopron County"),
                                                           CitiesListModel.CityModel.init(cityTag: "Gyor", name: "Győr", county: "Győr-Moson-Sopron County"),
                                                           CitiesListModel.CityModel.init(cityTag: "Budapest", name: "Budapest", county: nil),
                                                           CitiesListModel.CityModel.init(cityTag: "Debrecen", name: "Debrecen", county: "Hajdú-Bihar County"),
                                                           CitiesListModel.CityModel.init(cityTag: "Szeged", name: "Szeged", county: "Csongrád County"),
                                                           CitiesListModel.CityModel.init(cityTag: "Morgul", name: "Morgul", county: "Mordor")])

    func load() {
        self.presenter?.present(model: cities)
    }
    
}
