//
//  WeatherDetailViewController.swift
//  Weather
//
//  Created by Németh Bendegúz on 2019. 01. 11..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController, WeatherDetailViewProtocol {
    
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var pressureLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var presenter: WeatherDetailPresenter!
    
    var cityName: String? {
        didSet {
            self.navigationItem.title = cityName
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
    }
    
    // MARK: - WeatherDetailViewProtocol
    
    func display(viewContent: WeatherDetailViewContent) {
        self.mainLabel.text = viewContent.main
        self.descriptionLabel.text = viewContent.description
        self.temperatureLabel.text = viewContent.temperature
        self.pressureLabel.text = viewContent.pressure
        self.humidityLabel.text = viewContent.humidity
    }
    
    func stopActivityIndicator() {
        self.activityIndicator.stopAnimating()
    }
    
    func showAlertController(_ alertController: UIAlertController) {
        self.present(alertController, animated: true, completion: nil)
    }
    
}
