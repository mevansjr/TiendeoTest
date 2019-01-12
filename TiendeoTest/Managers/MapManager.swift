//
//  MapManager.swift
//  TiendeoTest
//
//  Created by Jesús Solé on 12/01/2019.
//  Copyright © 2019 JSolec. All rights reserved.
//

import UIKit
import MapKit

class MapManager: NSObject {
    class func setupPin(mapView: MKMapView, location: CLLocationCoordinate2D, title: String) {
        mapView.removeAnnotations(mapView.annotations)
        
        let placeAnnotation = MKPointAnnotation()
        placeAnnotation.coordinate = location
        placeAnnotation.title = title
        mapView.addAnnotation(placeAnnotation)
            
        mapView.selectAnnotation(placeAnnotation, animated: true)
    }
}
