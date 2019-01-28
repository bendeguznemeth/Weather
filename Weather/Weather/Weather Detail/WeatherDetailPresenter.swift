//
//  WeatherDetailPresenter.swift
//  Weather
//
//  Created by Németh Bendegúz on 2019. 01. 24..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import UIKit

class WeatherDetailPresenter: WeatherDetailPresenting {
    
    private weak var view: WeatherDetailViewProtocol?
    private let interactor: WeatherDetailInteractor
    
    // MARK: - Lifecycle
    
    init(view: WeatherDetailViewProtocol, interactor: WeatherDetailInteractor) {
        self.view = view
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        self.interactor.load()
    }
    
    // MARK: - Private
    
    private func getViewContent(from model: WeatherDetailModel) -> WeatherDetailViewContent {
        let mainString = model.main
        let descriptionString = model.description
        let temperatureString = "\(Int(model.temperature)) °C"
        let pressureString = "\(Int(model.pressure)) hpa"
        let humidityString = "\(Int(model.humidity)) %"
        
        return WeatherDetailViewContent(main: mainString, description: descriptionString, temperature: temperatureString, pressure: pressureString, humidity: humidityString)
    }
    
    private func display(error: Error) {
        let message = makeErrorString(from: error)
        
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        let retryAction = UIAlertAction(title: "Retry", style: .default) { (_) in
            self.interactor.load()
        }
        alertController.addAction(retryAction)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { (_) in
            self.view?.stopActivityIndicator()
        })
        alertController.addAction(okAction)
        
        self.view?.showAlertController(alertController)
    }
    
    private func makeErrorString(from error: Error) -> String {
        let errorString: String
        
        switch error {
        case let OpenWeatherError.noDataError(noDataErrorString):
            errorString = noDataErrorString
        case let OpenWeatherError.parsingError(parsingErrorString):
            errorString = parsingErrorString
        case let OpenWeatherError.noMessageError(noMessageError):
            errorString = noMessageError
        default:
            errorString = error.localizedDescription
        }
        
        return errorString
    }
    
    // MARK: - WeatherDetailPresenting
    
    func onError(with error: Error) {
        DispatchQueue.main.async { [weak self] in
            self?.display(error: error)
        }
    }
    
    func onSuccess(with model: WeatherDetailModel) {
        let viewContent = self.getViewContent(from: model)
        DispatchQueue.main.async {
            self.view?.display(viewContent: viewContent)
            self.view?.stopActivityIndicator()
        }
    }
    
}
