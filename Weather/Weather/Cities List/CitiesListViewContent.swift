//
//  CitiesListViewContent.swift
//  Weather
//
//  Created by Németh Bendegúz on 2019. 01. 24..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

struct CitiesListViewContent {
    
    let citiesListCellContents: [CitiesListCellViewContent]
    
    struct CitiesListCellViewContent {
        
        let cityTag: String
        let name: String
        let county: String
    }
    
}
