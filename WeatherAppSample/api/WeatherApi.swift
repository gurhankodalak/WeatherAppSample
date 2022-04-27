//
//  WeatherApi.swift
//  WeatherAppSample
//
//  Created by Gürhan Kodalak on 19.04.2022.
//

import Foundation
import Moya

enum WeatherApi {
    case getCurrentWeather(params: [String: Any])
    case getNextDaysWeather(params: [String: Any])
    case getWeatherStatusIcon(iconCode: String)
}

extension WeatherApi: TargetType {
    var baseURL: URL {
        var urlString = ApiManager.shared.baseURL
        switch self {
        case .getWeatherStatusIcon:
            urlString = ApiManager.shared.iconURL
        default:
            break
        }
        guard let url = URL(string: urlString) else {
            preconditionFailure("Error while setting base URL")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .getCurrentWeather:
            return "data/2.5/weather"
        case .getNextDaysWeather:
            return "/data/2.5/onecall"
        case let .getWeatherStatusIcon(iconCode: iconCode):
            return "/img/wn/\(iconCode)@2x.png"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        switch self {
        case .getCurrentWeather(let params):
            return .requestParameters(parameters: ApiManager.shared.addExtraParametersToParams(parameters: params),
                                      encoding: URLEncoding.default)
        case .getNextDaysWeather(let params):
            return .requestParameters(parameters: ApiManager.shared.addExtraParametersToParams(parameters: params),
                                      encoding: URLEncoding.default)
        case .getWeatherStatusIcon:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getWeatherStatusIcon:
            return ApiManager.shared.defaultHeaders
        default:
            return ApiManager.shared.defaultHeaders
        }
        
    }
    
}


