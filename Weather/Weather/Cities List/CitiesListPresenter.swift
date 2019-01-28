//
//  CitiesListPresenter.swift
//  Weather
//
//  Created by Németh Bendegúz on 2019. 01. 24..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import UIKit

class CitiesListPresenter: CitiesListPresenting {
    
    private weak var view: CitiesListViewProtocol?
    private let interactor: CitiesListInteractor
    
    // MARK: - Lifecycle
    
    init(view: CitiesListViewProtocol, interactor: CitiesListInteractor) {
        self.view = view
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        self.interactor.load()
    }
    
    // MARK: - Private
    
    private func getViewContent(from model: CitiesListModel) -> CitiesListViewContent {
        let citiesListCellContents = model.cityModels.map { (citymodel) -> CitiesListViewContent.CitiesListCellViewContent in
            let countyString: String
            
            if let county = citymodel.county {
                countyString = county
            } else {
                countyString = citymodel.name
            }
            
            return CitiesListViewContent.CitiesListCellViewContent.init(cityID: citymodel.cityID, name: citymodel.name, county: countyString)
        }
        
        return CitiesListViewContent(citiesListCellContents: citiesListCellContents)
    }
    
    // MARK: - CitiesListPresenting
    
    func present(model: CitiesListModel) {
        let viewContent = self.getViewContent(from: model)
        DispatchQueue.main.async {
            self.view?.display(viewContent: viewContent)
        }
    }
    
}
