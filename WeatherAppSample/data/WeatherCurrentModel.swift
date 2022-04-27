//
//  WeatherCurrentModel.swift
//  WeatherAppSample
//
//  Created by Gürhan Kodalak on 20.04.2022.
//

import Foundation

struct WeatherCurrentModel: Codable {
    var dt: Double?
    var sunrise: Double?
    var temp: Double?
    var feelsLike: Double?
    var pressure: Double?
    var humidity: Double?
    var weather: [WeatherModel]?
    
    enum CodingKeys: String, CodingKey {
        case dt
        case sunrise
        case temp
        case feelsLike = "feels_like"
        case pressure
        case humidity
        case weather
    }
}

