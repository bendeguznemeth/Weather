//
//  URLBuilder.swift
//  Weather
//
//  Created by Németh Bendegúz on 2019. 01. 25..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import Foundation

struct URLBuilder {
    
    static let scheme = "weather"
    
    static func buildURLWith(host: String, path: String?, parameters: [String:String]?) -> URL {
        var urlComponents = URLComponents()
        
        urlComponents.scheme = scheme
        urlComponents.host = host
        var _path = path ?? ""
        if _path.count > 0 {
            if _path.hasPrefix("/") == false {
                _path = "/" + _path
            }
        }
        
        urlComponents.path = _path
        
        if let _parameters = parameters {
            if _parameters.count > 0 {
                var queryItems = [URLQueryItem]()
                
                for (key, value) in _parameters {
                    let queryItem = URLQueryItem(name: key, value: value)
                    
                    queryItems.append(queryItem)
                }
                
                urlComponents.queryItems = queryItems
            }
        }
        
        
        guard let url = urlComponents.url else {
            return URL(string: "weather://")!
        }
        
        return url
    }
}
