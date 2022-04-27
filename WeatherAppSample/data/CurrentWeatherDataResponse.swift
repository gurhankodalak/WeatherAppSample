//
//  CurrentWeatherDataResponse.swift
//  WeatherAppSample
//
//  Created by Gürhan Kodalak on 20.04.2022.
//

import Foundation

struct CurrentWeatherDataResponse: Codable {
    var name: String?
    var weather: [WeatherModel]?
    var main: WeatherMainModel?
}


