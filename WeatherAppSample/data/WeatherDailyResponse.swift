//
//  WeatherDailyResponse.swift
//  WeatherAppSample
//
//  Created by Gürhan Kodalak on 20.04.2022.
//

import Foundation

struct WeatherDailyResponse: Codable {
    var current: WeatherCurrentModel?
    var daily: [WeatherDailyItemResponse]?
}
