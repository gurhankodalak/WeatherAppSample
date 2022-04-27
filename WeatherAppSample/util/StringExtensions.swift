//
//  StringExtensions.swift
//  WeatherAppSample
//
//  Created by Gürhan Kodalak on 20.04.2022.
//

import Foundation

extension String {
    
    var celciusFormatted: String {
        return self + "°"
    }
}

extension Double {
    var celciusValue: String {
        let formattedValue = String(format: "%.0f", self)
        return formattedValue.celciusFormatted
    }
}
