//
//  LocationHandler.swift
//  TiendeoTest
//
//  Created by Jesús Solé on 12/01/2019.
//  Copyright © 2019 JSolec. All rights reserved.
//

import UIKit
import CoreLocation

protocol LocationHandlerDelegate {
    func locationAuthorized()
    func locationNotAuthorized()
}

class LocationHandler: NSObject {
    
    var locationManager: CLLocationManager!
    var delegate: LocationHandlerDelegate?
    
    static let manager: LocationHandler = {
        let instance = LocationHandler()
        instance.loadLocationManager()
        instance.startUpdatingLocation()
        return instance
    }()
    
    func loadLocationManager() {
        
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        self.requestPermission()
    }
    
    func requestPermission() {
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.requestLocation()
    }
    
    func startUpdatingLocation() {
        self.locationManager.startUpdatingLocation()
    }
    
    static func isLocationPermissionEnabled() -> Bool {
        if CLLocationManager.locationServicesEnabled() {
            switch(CLLocationManager.authorizationStatus()) {
            case .notDetermined, .restricted, .denied:
                return false
            case .authorizedAlways, .authorizedWhenInUse:
                return true
            }
        } else {
            print("Location services are not enabled")
        }
        return false
    }
}

extension LocationHandler: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location Manager \(manager) didFailWithError: \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if let delegate = self.delegate {
            if status == .authorizedWhenInUse || status == .authorizedAlways {
                delegate.locationAuthorized()
            } else {
                delegate.locationNotAuthorized()
            }
        }
    }
}

