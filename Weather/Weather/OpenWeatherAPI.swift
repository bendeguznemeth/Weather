//
//  OpenWeatherAPI.swift
//  Weather
//
//  Created by Németh Bendegúz on 2019. 01. 14..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import Foundation

enum APIResult<Value> {
    case success(Value)
    case failure(Error)
}

enum OpenWeatherError: Error {
    case noDataError(String)
    case parsingError(String)
    case noMessageError(String)
}

struct OpenWeatherAPI {
    
    private static let baseURLString = "https://api.openweathermap.org/data/2.5/weather"
    private static let apiKey = "6201d38af6afd8d07c7e1e0355153689"
    
    static func getWeatherInfo(for cityTag: String, completion: @escaping (APIResult<WeatherDetailModel>) -> Void) {
        let url = createURL(for: cityTag)
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let content = data else {
                let noDataError = OpenWeatherError.noDataError("We have not got any data back")
                completion(.failure(noDataError))
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
                        guard
                            let jsonDictionary = jsonObject as? [AnyHashable:Any],
                            let message = jsonDictionary["message"] as? String else {
                                let noMessageError = OpenWeatherError.noMessageError("No message arrived")
                                completion(.failure(noMessageError))
                                return
                        }
                        let parsingError = OpenWeatherError.parsingError(message)
                        completion(.failure(parsingError))
                        return
                }
                
                let weatherDetail = WeatherDetailModel(main: mainWeather, description: weatherDescription, temperature: temperature, pressure: pressure, humidity: humidity)
                
                completion(.success(weatherDetail))
                
            } catch let error {
                completion(.failure(error))
                return
            }
        }
        
        task.resume()
    }
    
    private static func createURL(for cityTag: String) -> URL {
        var components = URLComponents(string: baseURLString)
        
        var queryItems = [URLQueryItem]()
        
        let params = [
            "q": cityTag,
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
