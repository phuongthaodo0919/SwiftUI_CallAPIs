//
//  ModelService.swift
//  BreedDog.SwiftUI
//
//  Created by Salmdo on 4/16/23.
//

import Foundation


struct WeatherService {
    func getWeather(city: String, completion: @escaping (WeatherModel?) -> ()){
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=2e00c287fb1636e3b31cfafe7456dc9c") else {
            completion(nil)
            fatalError("Could get weather url")
        }
        
        DispatchQueue.main.async {
            URLSession.shared.dataTask(with: url) { data, res, err in
                guard let data else {
                    completion(nil)
                    fatalError("Data is null")
                }
                
                do {
                    let weatherData = try JSONDecoder().decode(WeatherResponse.self, from: data)
                    completion(weatherData.main)
                } catch {
                    completion(nil)
                    fatalError("Data is null")
                }
                
            }.resume()
        }
    }
}
