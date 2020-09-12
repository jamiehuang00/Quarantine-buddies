//
//  matchController.swift
//  QuarantineBuddies
//
//  Created by Jamie Huang on 9/11/20.
//  Copyright © 2020 Jamie Huang. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

class matchController: UIViewController, CLLocationManagerDelegate {
    
    private var locationManager:CLLocationManager?
    
     private let latLngLabel: UILabel = {
           let label = UILabel()
           label.backgroundColor = .systemFill
           label.numberOfLines = 0
           label.textAlignment = .center
           label.font = .systemFont(ofSize: 26)
           return label
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        latLngLabel.frame = CGRect(x: 20, y: view.bounds.height / 2 - 380, width: view.bounds.width - 40, height: 60)
        view.addSubview(latLngLabel)
        
        locationManager = CLLocationManager()
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
        locationManager?.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            latLngLabel.text = "Lat: \(location.coordinate.latitude) \nLng: \(location.coordinate.longitude)"
            latLngLabel.font = UIFont(name: "Avenir", size: 15.0)
        }
    }
}


