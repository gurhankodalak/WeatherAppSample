//
//  ApiManager.swift
//  WeatherAppSample
//
//  Created by Gürhan Kodalak on 19.04.2022.
//

import Foundation

final class ApiManager {
    var baseURL: String = "https://api.openweathermap.org"
    var iconURL = "http://openweathermap.org"
    
    static let openWeatherAppId = "9995d7c4b16e3fc416ea329bf641acd5"
    static let shared = ApiManager()
    
    var defaultHeaders: [String: String] = [:]
    var defaultImageHeaders: [String: String] = [
        "Content-Type": "image/png"
    ]
    
    func addExtraParametersToParams(parameters: [String:Any]) ->  [String:Any] {
        var params = parameters
        params["appId"] = ApiManager.openWeatherAppId
        params["units"] = "metric"
        return params
    }
    
}
