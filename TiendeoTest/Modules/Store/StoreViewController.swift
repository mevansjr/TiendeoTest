//
//  StoreViewController.swift
//  TiendeoTest
//
//  Created Jesús Solé on 12/01/2019.
//  Copyright © 2019 JSolec. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit
import MapKit

class StoreViewController: UIViewController, StoreViewProtocol {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressTitleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var webTitleLabel: UILabel!
    @IBOutlet weak var webButton: UIButton!
    @IBOutlet weak var phoneTitleLabel: UILabel!
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var mapButton: UIButton!
    
    private var locationManager = LocationManager()
    
    var presenter: StorePresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
        self.requestPermission()
        self.setupMap()
        self.addStorePin()
    }
    
    private func setupView() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.mapView.showsUserLocation = true
        self.mapView.isZoomEnabled = true
        
        self.nameLabel.text = self.presenter?.getStoreName()
        
        self.addressTitleLabel.text = "kStoreAddress".localize
        self.addressLabel.text = self.presenter?.getStoreCompleteAddress()
        
        self.webTitleLabel.text = "kStoreWeb".localize
        self.webButton.setTitle(self.presenter?.getStoreWeb(), for: .normal)
        
        if let phone = self.presenter?.getStorePhone() {
            self.phoneTitleLabel.text = "kStorePhone".localize
            self.phoneButton.setTitle(phone, for: .normal)
        } else {
            self.phoneTitleLabel.isHidden = true
        }
        
        self.mapButton.setTitle("kOpenMap".localize, for: .normal)
        self.mapButton.layer.cornerRadius = 5
        self.mapButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.mapButton.layer.shadowOpacity = 0.3
    }
    
    private func requestPermission() {
        self.locationManager.loadLocationManager()
        self.locationManager.delegate = self
        self.locationManager.requestPermission()
        self.locationManager.startUpdatingLocation()
    }
    
    private func addStorePin() {
        MapManager.setupPin(mapView: self.mapView,
                            location: self.presenter?.getStoreLocation() ?? CLLocationCoordinate2D(),
                            title: self.presenter?.getStoreName() ?? "")
    }
    
    private func setupMap() {
        let location = self.presenter?.getStoreLocation() ?? CLLocationCoordinate2D()
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: location, span: span)
        
        self.mapView.setRegion(region, animated: true)
        self.mapView.regionThatFits(region)
    }

    @IBAction func webTapped(_ sender: Any) {
        Utils.openURL(url: self.presenter?.getStoreWeb() ?? "")
    }
    
    @IBAction func phoneTapped(_ sender: Any) {
        Utils.openPhone(phoneNumber: self.presenter?.getStorePhone() ?? "")
    }
    
    @IBAction func mapTapped(_ sender: Any) {
        MapManager.openAppleMapForPlace(route: true,
                                        centerName: self.presenter?.getStoreName() ?? "",
                                        location: self.presenter?.getStoreLocation() ?? CLLocationCoordinate2D())
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.popViewController(animated: true)
    }
}

extension StoreViewController: LocationManagerDelegate {
    func locationAuthorized() {
        print("Location Authorized")
    }
    
    func locationNotAuthorized() {
        print("Location Not Authorized")
    }
}
