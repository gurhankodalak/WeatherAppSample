//
//  DailyWeatherItemTableViewCell.swift
//  WeatherAppSample
//
//  Created by Gürhan Kodalak on 20.04.2022.
//

import UIKit

class DailyWeatherItemTableViewCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.containerView.giveCorner(radius: 10)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadData(items: [WeatherDailyItemResponse]) {
        for item in items {
            let dailyView = WeatherDayView()
            self.stackView.addArrangedSubview(dailyView)
            dailyView.heightAnchor.constraint(equalToConstant: 50).isActive = true
            dailyView.loadDailyData(item: item)
        }
    }

}
