//
//  ViewExtensions.swift
//  WeatherAppSample
//
//  Created by Gürhan Kodalak on 20.04.2022.
//

import UIKit

extension UIView {
    func giveCorner(radius: CGFloat) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius
    }
}
