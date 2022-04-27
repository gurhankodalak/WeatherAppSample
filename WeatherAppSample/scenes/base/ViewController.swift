//
//  ViewController.swift
//  WeatherAppSample
//
//  Created by Gürhan Kodalak on 16.04.2022.
//

import UIKit

class ViewController: UIViewController {

    private var activityIndicator: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func showLoading() {
        if #available(iOS 13.0, *) {
            self.activityIndicator = UIActivityIndicatorView(style: .large)
            self.activityIndicator?.frame = self.view.bounds
            self.view.addSubview(activityIndicator!)
            self.activityIndicator?.startAnimating()
        } else {
            // Fallback on earlier versions
        }
    }
    
    func hideLoading() {
        self.activityIndicator?.stopAnimating()
        self.activityIndicator?.removeFromSuperview()
    }
    
    func showAlert(message: String) {
        
    }
    
}

