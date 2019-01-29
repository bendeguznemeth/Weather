//
//  CitiesListFactory.swift
//  Weather
//
//  Created by Németh Bendegúz on 2019. 01. 25..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import UIKit

struct CitiesListParams {
    
}

extension UseCaseFactory {
    
    static func createCitiesListVC(with params: CitiesListParams) -> CitiesListViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let citiesListViewController = storyboard.instantiateViewController(withIdentifier: "CitiesListViewController") as? CitiesListViewController else {
            fatalError("CitiesListViewController cannot be instantiated")
        }
        
        let citiesListInteractor = CitiesListInteractor()
        
        let navigator = Navigator()
        let citiesListPresenter = CitiesListPresenter(view: citiesListViewController, interactor: citiesListInteractor, navigator: navigator)
        
        citiesListInteractor.presenter = citiesListPresenter
        citiesListViewController.presenter = citiesListPresenter
        
        return citiesListViewController
    }
}
