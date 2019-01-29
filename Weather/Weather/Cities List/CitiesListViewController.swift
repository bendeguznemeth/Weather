//
//  CitiesListViewController.swift
//  Weather
//
//  Created by Németh Bendegúz on 2019. 01. 11..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import UIKit

class CitiesListViewController: UIViewController, CitiesListViewProtocol {
    
    @IBOutlet var citiesListTableView: UITableView!
    
    var presenter: CitiesListPresenter!
    
    fileprivate var viewContent: CitiesListViewContent?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.citiesListTableView.delegate = self
        self.citiesListTableView.dataSource = self
        
        self.presenter.viewDidLoad()
    }
    
    // MARK: - CitiesListViewProtocol
    
    func display(viewContent: CitiesListViewContent) {
        self.viewContent = viewContent
        self.citiesListTableView.reloadData()
    }
    
    // MARK: - Navigation
    
    private func navigateToDetailVC(cityString: String?, cityTag: String?) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        guard let detailVC = sb.instantiateViewController(withIdentifier: "WeatherDetailViewController") as? WeatherDetailViewController else {
            fatalError("Could not create WeatherDetailViewController")
        }
        
        guard let cityTag = cityTag else {
            fatalError("Did not get cityTag")
        }
        
        let weatherDetailInteractor = WeatherDetailInteractor(cityTag: cityTag)
        let weatherDetailPresenter = WeatherDetailPresenter(view: detailVC, interactor: weatherDetailInteractor)
        
        weatherDetailInteractor.presenter = weatherDetailPresenter
        detailVC.presenter = weatherDetailPresenter
        
        detailVC.cityString = cityString
        
        guard let navigationController = self.navigationController else {
            fatalError("Could not create NavigationController")
        }
        
        navigationController.pushViewController(detailVC, animated: true)
    }
    
}

extension CitiesListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityViewContent = self.viewContent?.citiesListCellContents[indexPath.row]
        
        let cityString = cityViewContent?.name
        let cityTag = cityViewContent?.cityTag
        
        self.navigateToDetailVC(cityString: cityString, cityTag: cityTag)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewContent?.citiesListCellContents.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let cityViewContent = self.viewContent?.citiesListCellContents[indexPath.row]
        
        cell.textLabel?.text = cityViewContent?.name
        cell.detailTextLabel?.text = cityViewContent?.county
        
        return cell
    }
    
}
