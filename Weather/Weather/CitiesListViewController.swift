//
//  CitiesListViewController.swift
//  Weather
//
//  Created by Németh Bendegúz on 2019. 01. 11..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import UIKit

class CitiesListViewController: UIViewController {

    @IBOutlet var citiesListTableView: UITableView!
    
    private let citiesDataSource = CitiesDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.citiesListTableView.dataSource = self.citiesDataSource
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch segue.identifier {
        case "showWeatherInfo":
            guard let selectedIndexPath = self.citiesListTableView.indexPathForSelectedRow else {
                fatalError("showWeatherInfo segue triggered without a selected row in citiesListTableView")
            }
            
            let city = self.citiesDataSource.cities[selectedIndexPath.row]

            guard let destinationVC = segue.destination as? WeatherDetailViewController else {
                fatalError("Can not create destinationVC as WeatherDetailViewController")
            }
            
            destinationVC.city = city
        default:
            fatalError("Unexpected Segue Identifier: \(String(describing: segue.identifier))")
        }
    }
}
