//
//  CurrentWeatherInfoTableViewCell.swift
//  WeatherAppSample
//
//  Created by Gürhan Kodalak on 20.04.2022.
//

import UIKit

class CurrentWeatherInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var locationInfoText: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var weatherInfoLabel: UILabel!
    @IBOutlet weak var weatherTemperatureInfo: UILabel!
    
    @IBOutlet weak var currentTemperature: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.containerView.giveCorner(radius: 10)
        // Initialization code
    }

    func loadWeatherData(data: CurrentWeatherDataResponse) {
        self.locationInfoText.text = data.name
        self.weatherInfoLabel.text = data.weather?.first?.description
        self.weatherTemperatureInfo.text = data.main?.getMaxMinTempDisplayText()
        self.currentTemperature.text = data.main?.temp?.celciusValue
        guard let iconCode = data.weather?.first?.icon else {return}
        ImageDownloader.shared.getWeatherIcon(code: iconCode) { image in
            if let image = image {
                self.weatherIcon.image = image
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
