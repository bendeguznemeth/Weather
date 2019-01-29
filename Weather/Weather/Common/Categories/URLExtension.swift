//
//  URLExtension.swift
//  Weather
//
//  Created by Németh Bendegúz on 2019. 01. 29..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import Foundation

extension URL {
    
    func realPathComponents() -> [String] {
        return self.pathComponents.filter { return $0 != "/" && $0 != "" }
    }
    
    func queryParameterForKey(_ key: String) -> String? {
        return URLComponents(url: self, resolvingAgainstBaseURL: false)?.queryItems?.filter { return $0.name == key }.first?.value
    }
    
    func setQueryParameter(key: String, value: String) -> URL {
        guard var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: false) else {
            return self
        }
        
        var newQueryItems = [URLQueryItem]()
        var found = false
        for item in urlComponents.queryItems ?? [URLQueryItem]() {
            if item.name == key {
                newQueryItems.append(URLQueryItem(name: key, value: value))
                found = true
            } else {
                newQueryItems.append(item)
            }
        }
        if found == false {
            newQueryItems.append(URLQueryItem(name: key, value: value))
        }
        
        urlComponents.queryItems = newQueryItems
        
        return urlComponents.url!
    }
    
    func addQueryParameter(key: String, value: String) -> URL {
        guard var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: false) else {
            return self
        }
        var queryItems = urlComponents.queryItems ?? [URLQueryItem]()
        
        queryItems.append(URLQueryItem(name: key, value: value))
        
        urlComponents.queryItems = queryItems
        
        return urlComponents.url!
    }
}
