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
    
    class func openAppleMapForPlace(route: Bool, centerName: String, location: CLLocationCoordinate2D) {
        let regionDistance:CLLocationDistance = 100
        let regionSpan = MKCoordinateRegion(center: location,
                                            latitudinalMeters: regionDistance,
                                            longitudinalMeters: regionDistance)
        var options: [String : Any] = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
                                       MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        if route {
            if #available(iOS 10.0, *) {
                options[MKLaunchOptionsDirectionsModeKey] = MKLaunchOptionsDirectionsModeDefault
            } else {
                options[MKLaunchOptionsDirectionsModeKey] = MKLaunchOptionsDirectionsModeDriving
            }
        }
        let placemark = MKPlacemark(coordinate: location, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = centerName
        mapItem.openInMaps(launchOptions: options)
    }
}
