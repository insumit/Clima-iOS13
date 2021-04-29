//
//  WeatherManager.swift
//  Clima
//
//  Created by Sumit Mandal on 30/04/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=0df6420f6825f494182e07a48fa9b38c&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        //1. Create URL
        if let url = URL(string: urlString) {
            //2. Create URL Session
            let session = URLSession(configuration: .default)
            //3. Give the session a task
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            //4. Start the task
            task.resume()
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString!)
        }
        
    }
}
