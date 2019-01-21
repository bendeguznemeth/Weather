//
//  CitiesDataSource.swift
//  Weather
//
//  Created by Németh Bendegúz on 2019. 01. 11..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import UIKit

struct CitiesDataSource {
    
    static let cities = [
        City(id: "Sopron",name: "Sopron", county: "Győr-Moson-Sopron County"),
        City(id: "Gyor",name: "Győr", county: "Győr-Moson-Sopron County"),
        City(id: "Budapest",name: "Budapest", county: nil),
        City(id: "Debrecen",name: "Debrecen", county: "Hajdú-Bihar County"),
        City(id: "Szeged",name: "Szeged", county: "Csongrád County"),
        City(id: "Morgul",name: "Morgul", county: "Mordor")]
    
}
