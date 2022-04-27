//
//  SplashViewController.swift
//  WeatherAppSample
//
//  Created by Gürhan Kodalak on 18.04.2022.
//

import UIKit
import CoreLocation

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        LocationManager.shared.requestUserLocation { [weak self] location in
            guard let self = self else {return}
            self.routeHomeScreen()
        }
        // Do any additional setup after loading the view.
    }
    
    func routeHomeScreen() {
        let storyboard = UIStoryboard(name: "Home", bundle: Bundle.main)
        let controller = storyboard.instantiateInitialViewController()
        self.view.window?.rootViewController = controller
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
