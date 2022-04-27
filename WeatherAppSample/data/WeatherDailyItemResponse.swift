//
//  WeatherDailyItemResponse.swift
//  WeatherAppSample
//
//  Created by Gürhan Kodalak on 20.04.2022.
//

import Foundation

struct WeatherDailyItemResponse: Codable {
    var dt: Double?
    var sunrise: Double?
    var sunset: Double?
    var feelsLike: DailyTemperatureModel?
    var temp: DailyTemperatureModel?
    var pressure: Double?
    var humidity: Double?
    var weather: [WeatherModel]?
    
    enum CodingKeys: String, CodingKey {
        case dt
        case sunrise
        case sunset
        case feelsLike = "feels_like"
        case temp
        case pressure
        case humidity
        case weather
    }
}
