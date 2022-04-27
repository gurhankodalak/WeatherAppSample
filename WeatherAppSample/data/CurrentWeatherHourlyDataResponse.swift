//
//  CurrentWeatherHourlyDataResponse.swift
//  WeatherAppSample
//
//  Created by Gürhan Kodalak on 20.04.2022.
//

import Foundation

struct CurrentWeatherHourlyDataResponse: Codable {
    var hourly: [WeatherCurrentModel]?
}
