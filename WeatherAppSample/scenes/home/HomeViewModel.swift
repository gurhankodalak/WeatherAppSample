//
//  HomeViewModel.swift
//  WeatherAppSample
//
//  Created by Gürhan Kodalak on 20.04.2022.
//

import Foundation
import CoreLocation
import Moya

final class HomeViewModel {
    private let provider = MoyaProvider<WeatherApi>(plugins: [NetworkLoggerPlugin.verbose])
    
    func getCurrentWeatherData(location: CLLocation, completion: @escaping  ((CurrentWeatherDataResponse?, String?) -> Void)) {
        self.provider.request(.getCurrentWeather(params: ["lat": location.coordinate.latitude, "lon": location.coordinate.longitude])) { result in
            switch result {
            case let .success(response):
                do {
                    let model = try JSONDecoder().decode(CurrentWeatherDataResponse.self, from: response.data)
                    completion(model, nil)
                } catch  {
                    debugPrint("Json decoding error", error.localizedDescription)
                    completion(nil, error.localizedDescription)
                }
            case let .failure(error):
                debugPrint("Error while getting current weather data: ", error)
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    func getHourlyWeatherData(location: CLLocation, completion: @escaping  ((CurrentWeatherHourlyDataResponse?, String?) -> Void)) {
        self.provider.request(.getNextDaysWeather(params: ["lat": location.coordinate.latitude, "lon": location.coordinate.longitude, "exclude": "daily, minutely, current"])) { result in
            switch result {
            case let .success(response):
                do {
                    let model = try JSONDecoder().decode(CurrentWeatherHourlyDataResponse.self, from: response.data)
                    completion(model, nil)
                } catch  {
                    debugPrint("Json decoding error", error.localizedDescription)
                    completion(nil, error.localizedDescription)
                }
            case let .failure(error):
                debugPrint("Error while getting current weather data: ", error)
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    func getDailyWeatherData(location: CLLocation, completion: @escaping  ((WeatherDailyResponse?, String?) -> Void)) {
        self.provider.request(.getNextDaysWeather(params: ["lat": location.coordinate.latitude, "lon": location.coordinate.longitude, "exclude": "hourly, minutely, current"])) { result in
            switch result {
            case let .success(response):
                do {
                    let model = try JSONDecoder().decode(WeatherDailyResponse.self, from: response.data)
                    completion(model, nil)
                } catch  {
                    debugPrint("Json decoding error", error.localizedDescription)
                    completion(nil, error.localizedDescription)
                }
            case let .failure(error):
                debugPrint("Error while getting current weather data: ", error)
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    func getTodayHourlyWeatherData(data: CurrentWeatherHourlyDataResponse) -> [WeatherCurrentModel] {
        var items = [WeatherCurrentModel]()
        if let dataItems = data.hourly {
            for dataItem in dataItems {
                if let date = dataItem.dt?.getDate() {
                    if Calendar.current.isDateInToday(date) {
                        items.append(dataItem)
                    }
                }
                
            }
        }
        return items
    }
}
