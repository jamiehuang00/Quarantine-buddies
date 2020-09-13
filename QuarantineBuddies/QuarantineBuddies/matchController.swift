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
import Firebase

class matchController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var has1: UILabel!
    private var locationManager:CLLocationManager?
    var username: UITextField!
    var selfHas = [String]()
    var selfNeeds = [String]()
    
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
        
        matchUpNeeds()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
//            latLngLabel.text = "Lat: \(location.coordinate.latitude) \nLng: \(location.coordinate.longitude)"
            latLngLabel.font = UIFont(name: "Avenir", size: 15.0)
            let location1 = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            CLGeocoder().reverseGeocodeLocation(location, completionHandler:  {(placemarks, error) -> Void in
                if error != nil {
                    print("failed")
                    return
                }
                if (placemarks?.count)! > 0 {
                    let pm = placemarks?[0] as! CLPlacemark?
                    let address = (pm?.subThoroughfare)! + " " + (pm?.thoroughfare)!  + " " + (pm?.locality)! + "," + " " + (pm?.administrativeArea)! + " " + (pm?.postalCode)! + " " + (pm?.isoCountryCode)!
                    print(address)
                    self.latLngLabel.text = address
                }
                else {
                    print("error")
                }
            })
            let location2 = CLLocation(latitude: -37, longitude: -122)
            let distance = location1.distance(from: location2) // result is in meters
            print(distance)
            if (distance <= 10) {
                print("True")
            }
            else {
                print("False")
            }
        }
        
    }
    
    func matchUpNeeds() {
        let db = Firestore.firestore()
        let usersRef = db.collection("users")
        
//        usersRef.whereField(arrayContainsAny: ["west_coast", "east_coast"])
        
        let needsMasks = db.collection("users").whereField("masks", isEqualTo: false)
        needsMasks.getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                    
                    }
            }
        }
        
    }

}


