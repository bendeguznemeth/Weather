//
//  OpenWeatherAPI.swift
//  Weather
//
//  Created by Németh Bendegúz on 2019. 01. 14..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import Foundation

struct OpenWeatherAPI {
    
    private static let baseURLString = "https://api.openweathermap.org/data/2.5/weather"
    private static let apiKey = "6201d38af6afd8d07c7e1e0355153689"
    
    static func getWeatherInfo(for cityID: String, completion: @escaping (WeatherInfo) -> Void) {
        let url = createURL(for: cityID)
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("Error: \(String(describing: error))")
                return
            }
            
            guard let content = data else {
                print("We have not got any data back")
                return
            }
            
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: content, options: [])
                
                guard
                    let jsonDictionary = jsonObject as? [AnyHashable:Any],
                    let weather = jsonDictionary["weather"] as? [[String:Any]],
                    let mainWeather = weather.first?["main"] as? String,
                    let weatherDescription = weather.first?["description"] as? String,
                    let mainDetails = jsonDictionary["main"] as? [String:Any],
                    let temperature = mainDetails["temp"] as? Double,
                    let pressure = mainDetails["pressure"] as? Double,
                    let humidity = mainDetails["humidity"] as? Double else {
                        print("JSON parsing failed")
                        return
                }
                
                let weatherInfo = WeatherInfo(main: mainWeather, description: weatherDescription, temperature: temperature, pressure: pressure, humidity: humidity)
                
                DispatchQueue.main.sync {
                    completion(weatherInfo)
                }
                
            } catch {
                print("Could not create jsonObject")
            }
        }
        
        task.resume()
    }
    
    private static func createURL(for cityID: String) -> URL {
        var components = URLComponents(string: baseURLString)
        
        var queryItems = [URLQueryItem]()
        
        let params = [
            "q": cityID,
            "units": "metric",
            "APPID": apiKey
        ]
        
        for (key, value) in params {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        components?.queryItems = queryItems
        
        guard let url = components?.url else {
            fatalError("URL was not created")
        }
        
        return url
    }
}
