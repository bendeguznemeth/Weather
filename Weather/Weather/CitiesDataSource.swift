//
//  CitiesDataSource.swift
//  Weather
//
//  Created by Németh Bendegúz on 2019. 01. 11..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import UIKit

class CitiesDataSource: NSObject, UITableViewDataSource {
    
    let cities = [City(id: "Sopron",name: "Sopron", county: "Győr-Moson-Sopron County"),
                  City(id: "Gyor",name: "Győr", county: "Győr-Moson-Sopron County"),
                  City(id: "Budapest",name: "Budapest", county: nil),
                  City(id: "Debrecen",name: "Debrecen", county: "Hajdú-Bihar County"),
                  City(id: "Szeged",name: "Szeged", county: "Csongrád County"),
                  City(id: "Morgul",name: "Morgul", county: "Mordor")]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let city = cities[indexPath.row]
        
        cell.textLabel?.text = city.name
        
        if let county = city.county {
            cell.detailTextLabel?.text = county
        } else {
            cell.detailTextLabel?.text = city.name
        }
        
        return cell
    }
    
}
