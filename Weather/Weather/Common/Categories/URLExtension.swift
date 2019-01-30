//
//  URLExtension.swift
//  Weather
//
//  Created by Németh Bendegúz on 2019. 01. 29..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import Foundation

extension URL {
    
    func queryParameterForKey(_ key: String) -> String? {
        return URLComponents(url: self, resolvingAgainstBaseURL: false)?.queryItems?.filter { return $0.name == key }.first?.value
    }
    
}
