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
        do {
            guard let url =  URL(string: "http://openweathermap.org" + "/img/wn/\(code)@2x.png") else {
                debugPrint("URL error")
                completion(nil)
                return
            }
            let data = try Data(contentsOf: url)
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                completion(image)
            }
        } catch {
            completion(nil)
        }
    }
    
}

