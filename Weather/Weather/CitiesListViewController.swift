//
//  CitiesListViewController.swift
//  Weather
//
//  Created by Németh Bendegúz on 2019. 01. 11..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import UIKit

class CitiesListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var citiesListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.citiesListTableView.delegate = self
        self.citiesListTableView.dataSource = self
    }
    
    // TableView datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CitiesDataSource.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let city = CitiesDataSource.cities[indexPath.row]
        
        cell.textLabel?.text = city.name
        
        if let county = city.county {
            cell.detailTextLabel?.text = county
        } else {
            cell.detailTextLabel?.text = city.name
        }
        
        return cell
    }
    
    // TableView delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = CitiesDataSource.cities[indexPath.row]
        
        navigateToDetailVC(city: city)
    }
    
    private func navigateToDetailVC(city: City) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        guard let detailVC = sb.instantiateViewController(withIdentifier: "WeatherDetailViewController") as? WeatherDetailViewController else {
            fatalError("Could not create WeatherDetailViewController")
        }
        
        detailVC.city = city
        
        guard let navigationController = self.navigationController else {
            fatalError("Could not create NavigationController")
        }
        
        navigationController.pushViewController(detailVC, animated: true)
    }
}
