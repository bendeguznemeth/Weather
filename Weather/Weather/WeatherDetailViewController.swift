//
//  WeatherDetailViewController.swift
//  Weather
//
//  Created by Németh Bendegúz on 2019. 01. 11..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var pressureLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var city: City? {
        didSet {
            self.navigationItem.title = city?.name
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getWeatherInfo()
    }
    
    private func getWeatherInfo() {
        guard let cityID = city?.id else {
            fatalError("WeatherDetailViewController do not have a city")
        }
        
        OpenWeatherAPI.getWeatherInfo(for: cityID) { (result) in
            switch result {
            case let .success(weatherInfo):
                DispatchQueue.main.sync {
                    self.display(weatherInfo: weatherInfo)
                }
            case let .failure(error):
                let errorString = self.makeErrorString(from: error)
                
                DispatchQueue.main.sync {
                    self.showAlertController(with: errorString)
                }
            }
        }
    }
    
    private func display(weatherInfo: WeatherInfo) {
        self.mainLabel.text = weatherInfo.main
        self.descriptionLabel.text = weatherInfo.description
        self.temperatureLabel.text = "\(Int(weatherInfo.temperature)) °C"
        self.pressureLabel.text = "\(Int(weatherInfo.pressure)) hpa"
        self.humidityLabel.text = "\(Int(weatherInfo.humidity)) %"
        
        self.activityIndicator.stopAnimating()
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
    
    private func showAlertController(with message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        let retryAction = UIAlertAction(title: "Retry", style: .default) { (_) in
            self.getWeatherInfo()
        }
        alertController.addAction(retryAction)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { (_) in
            self.activityIndicator.stopAnimating()
        })
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
