//
//  WeatherModel.swift
//  WeatherAppSample
//
//  Created by Gürhan Kodalak on 20.04.2022.
//

import Foundation

struct WeatherModel: Codable {
    var id: Int64
    var main: String?
    var description: String?
    var icon: String?
}
