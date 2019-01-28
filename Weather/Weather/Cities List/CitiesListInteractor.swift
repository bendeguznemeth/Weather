//
//  CitiesListInteractor.swift
//  Weather
//
//  Created by Németh Bendegúz on 2019. 01. 24..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

class CitiesListInteractor {
    
    weak var presenter: CitiesListPresenting?
    
    private let cities = CitiesListModel.init(cityModels: [CitiesListModel.CityModel.init(cityID: "Sopron", name: "Sopron", county: "Győr-Moson-Sopron County"),
                                                           CitiesListModel.CityModel.init(cityID: "Gyor", name: "Győr", county: "Győr-Moson-Sopron County"),
                                                           CitiesListModel.CityModel.init(cityID: "Budapest", name: "Budapest", county: nil),
                                                           CitiesListModel.CityModel.init(cityID: "Debrecen", name: "Debrecen", county: "Hajdú-Bihar County"),
                                                           CitiesListModel.CityModel.init(cityID: "Szeged", name: "Szeged", county: "Csongrád County"),
                                                           CitiesListModel.CityModel.init(cityID: "Morgul", name: "Morgul", county: "Mordor")])

    func load() {
        self.presenter?.present(model: cities)
    }
    
}
