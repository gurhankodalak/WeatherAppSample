//
//  HourlyWeatherItemCollectionViewCell.swift
//  WeatherAppSample
//
//  Created by Gürhan Kodalak on 20.04.2022.
//

import UIKit

class HourlyWeatherItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var weatherTimeInfo: UILabel!
    @IBOutlet weak var temperatureText: UILabel!
    
    func loadData(item: WeatherCurrentModel) {
        self.weatherTimeInfo.text = item.dt?.getDate().getHhMmTime()
        self.temperatureText.text = item.temp?.celciusValue
        if let icon = item.weather?.first?.icon {
            ImageDownloader.shared.getWeatherIcon(code: icon) { image in
                self.weatherIcon.image = image
            }
        }
    }
}
