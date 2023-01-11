//
//  HttpService.swift
//  WeatherDemoApp
//
//  Created by mac on 11/01/23.
//

import UIKit

class HttpService: NSObject {
    
    
    func getWeatherData(){
        
        let url = URL(string: "https://api.weatherapi.com/v1/forecast.json?key=522db6a157a748e2996212343221502&q=Jaipur&days=7&aqi=no&alerts=no")!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(WeatherDataModel.self, from: data)
                print(responseModel)
            }
            catch {
                    print("JSONSerialization error:", error)
                }
            
        }
        task.resume()
        
    }
    
    
    
}


