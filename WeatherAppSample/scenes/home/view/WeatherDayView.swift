//
//  WeatherDayView.swift
//  WeatherAppSample
//
//  Created by Gürhan Kodalak on 20.04.2022.
//

import UIKit

class WeatherDayView: UIView {

    @IBOutlet weak var temperatureValue: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dateText: UILabel!
    @IBOutlet weak var contentView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        if self.subviews.count == 0 {
            nibSetup()
        }
    }
    
    private func nibSetup() {
        backgroundColor = .clear
        
        self.contentView = loadViewFromNib()
        self.contentView.frame = bounds
        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.contentView.translatesAutoresizingMaskIntoConstraints = true
        addSubview(self.contentView)
//        self.contentView.corner(10)
        self.configureView()
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return nibView
    }
    
    func configureView() {
        //Override this method for custom configurations
    }
    
    func loadDailyData(item: WeatherDailyItemResponse) {
        self.dateText.text = item.dt?.getDate().getDayString()
        self.temperatureValue.text = item.temp?.day?.celciusValue
        if let icon = item.weather?.first?.icon {
            ImageDownloader.shared.getWeatherIcon(code: icon) { image in
                DispatchQueue.main.async {
                    self.weatherIcon.image = image
                }
            }
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
