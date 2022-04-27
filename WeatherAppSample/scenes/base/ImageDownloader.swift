//
//  ImageDownloader.swift
//  WeatherAppSample
//
//  Created by Gürhan Kodalak on 20.04.2022.
//

import Foundation
import Moya
import UIKit

final class ImageDownloader {
    
    static let shared = ImageDownloader()
    
    private let provider = MoyaProvider<WeatherApi>()
    
    func getWeatherIcon(code: String, completion: @escaping ((UIImage?)->Void) )  {
        self.provider.request(.getWeatherStatusIcon(iconCode: code)) { result in
            switch result {
            case let .success(response):
                let image = UIImage(data: response.data)
                completion(image)
            default:
                completion(nil)
            }
        }
    }
    
}

