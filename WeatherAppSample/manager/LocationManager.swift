//
//  LocationManager.swift
//  WeatherAppSample
//
//  Created by Gürhan Kodalak on 19.04.2022.
//

import Foundation
import CoreLocation

final class LocationManager: NSObject {
    static let shared = LocationManager()
    
    private let locationManager = CLLocationManager()
    
    //for the cases of user did not authorized for location use default location Istanbul.
    var userLocation = CLLocation(latitude: 41, longitude: 29)
    var locationRequestCompletion: ((CLLocation) -> Void)?
    
    override init() {
        super.init()
        self.locationManager.delegate = self
    }
    
    func requestUserLocation(completion: ((CLLocation) -> Void)?) {
        self.locationRequestCompletion = completion
        if shouldAskForLocationPermission() {
            self.askForLocationPermission()
        }
        else {
            self.locationManager.requestLocation()
        }
    }
    
    func askForLocationPermission() {
        self.locationManager.requestWhenInUseAuthorization()
    }
    
    private func shouldAskForLocationPermission() -> Bool {
        if #available(iOS 14.0, *) {
            switch self.locationManager.authorizationStatus {
            case.notDetermined:
                return true
            case .authorizedWhenInUse, .authorizedAlways:
                return false
            default:
                debugPrint("Location permission denied or restricted")
                return false
            }
        } else {
            if CLLocationManager.authorizationStatus() == .notDetermined {
                return true
            }
            return false
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        if #available(iOS 14.0, *) {
            if manager.authorizationStatus == .authorizedWhenInUse {
                self.locationManager.requestLocation()
            }
            else {
                
                self.locationRequestCompletion?(self.userLocation)
            }
        } else {
            if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
                self.locationManager.requestLocation()
            }
            else {
                self.locationRequestCompletion?(self.userLocation)
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        debugPrint(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lastLocation = locations.last else {return}
        self.userLocation = lastLocation
        self.locationRequestCompletion?(lastLocation)
    }
}
