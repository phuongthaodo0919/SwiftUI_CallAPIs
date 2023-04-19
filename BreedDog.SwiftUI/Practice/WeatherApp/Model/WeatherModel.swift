//
//  WeatherModel.swift
//  BreedDog.SwiftUI
//
//  Created by Salmdo on 4/16/23.
//

import Foundation

class WeatherResponse: Codable {
    var main: WeatherModel?
    var name: String?
    
}

class WeatherModel: Codable {
    var temp: Double?
    var feels_like: Double?
}

