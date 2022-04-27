//
//  TemperatureMainModel.swift
//  WeatherAppSample
//
//  Created by Gürhan Kodalak on 20.04.2022.
//

import Foundation

struct WeatherMainModel: Codable {
    var temp: Double?
    var feelsLike: Double?
    var tempMin: Double?
    var tempMax: Double?
    var pressure: Double?
    var humidity: Double?
    var icon: String?
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case humidity
    }
    
    func getMaxMinTempDisplayText() -> String {
        guard let tempMax = tempMax, let tempMin = tempMin else {
            return ""
        }
        let formattedTempMax = String(format: "%.0f", tempMax).celciusFormatted
        let formattedTempMin = String(format: "%.0f", tempMin).celciusFormatted
        return "H:\(formattedTempMax)  L:\(formattedTempMin)"
    }
}
