//
//  WeatherDetailViewProtocol.swift
//  Weather
//
//  Created by Németh Bendegúz on 2019. 01. 24..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import UIKit

protocol WeatherDetailViewProtocol: class {
    
    func display(viewContent: WeatherDetailViewContent)
    
    func stopActivityIndicator()
    
    func showAlertController(_ alertController: UIAlertController)
    
}
