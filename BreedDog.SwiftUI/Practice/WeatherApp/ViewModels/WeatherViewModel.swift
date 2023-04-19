//
//  WeatherViewMode.swift
//  BreedDog.SwiftUI
//
//  Created by Salmdo on 4/16/23.
//

import Foundation

class WeatherViewModel: ObservableObject {
    
    @Published private var weather = WeatherModel()
    
    var weatherService: WeatherService!
    
    init(){
        weatherService = WeatherService()
    }
    
    var feelLike: String {
        if let fl = weather.feels_like {
            return String(format: "%.0f", fl)
        } else {
            return ""
        }
    }
    
    var cityName: String = ""
    func search(){
        fetchWeather(city: cityName)
    }
    
    private func fetchWeather(city: String){
        weatherService.getWeather(city: city) { weatherModel in
            if let weatherModel {
                self.weather = weatherModel
            }
            
        }
    }
    
}
