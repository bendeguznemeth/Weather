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
    
}

extension CitiesListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityViewContent = self.viewContent?.citiesListCellContents[indexPath.row]
        
        guard let cityName = cityViewContent?.name else {
            fatalError("Did not get cityName")
        }
        
        guard let cityTag = cityViewContent?.cityTag else {
            fatalError("Did not get cityTag")
        }
        
        self.presenter.onCityClicked(cityTag: cityTag, cityName: cityName)
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
