//
//  itemsController.swift
//  QuarantineBuddies
//
//  Created by Jamie Huang on 9/11/20.
//  Copyright © 2020 Jamie Huang. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import UIKit

class itemsController: UIViewController {
    var ref = Database.database().reference()
    @IBOutlet var haveCollection: [UIButton]!
    @IBOutlet weak var masksbutton1: UIButton!
    @IBOutlet weak var glovesbutton1: UIButton!
    @IBOutlet weak var toiletpaperbutton1: UIButton!
    @IBOutlet weak var sanitarybutton1: UIButton!
    @IBOutlet weak var electronicsbutton1: UIButton!
    @IBOutlet weak var soapbutton1: UIButton!
    @IBOutlet weak var waterbutton1: UIButton!
    @IBOutlet weak var lotionbutton1: UIButton!
    @IBOutlet weak var handsanibutton1: UIButton!
    @IBOutlet weak var papertowelsbutton1: UIButton!
    @IBOutlet weak var cannedfoodbutton1: UIButton!
    @IBOutlet weak var chapstickbutton1: UIButton!
    
    @IBOutlet var needCollection: [UIButton]!

    var user: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
    
    
    @IBAction func havePressed(_ sender: Any) {
        haveCollection.forEach { (button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                button.layer.borderWidth = 2
                self.view.layoutIfNeeded()
            })
        }
    }
    
    
    @IBAction func needPressed(_ sender: Any) {
        needCollection.forEach { (button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                button.layer.borderWidth = 2
                self.view.layoutIfNeeded()
            })
        }
    }
    
    
    @IBAction func masks1Tapped(_ sender: Any) {
        if let username = user.text {
            let db = Firestore.firestore()
            db.collection("users").document(username).setData([
                "masks": true
            ], merge: true)
        }
        masksbutton1.backgroundColor = UIColor.purple
    }
    
    @IBAction func gloves1Tapped(_ sender: Any) {
           if let username = user.text {
               let db = Firestore.firestore()
               db.collection("users").document(username).setData([
                   "gloves": true
               ], merge: true)
           }
        glovesbutton1.backgroundColor = UIColor.purple
       }
    
    
    @IBAction func toiletpaper1Tapped(_ sender: Any) {
        if let username = user.text {
            let db = Firestore.firestore()
            db.collection("users").document(username).setData([
                "toilet paper": true
            ], merge: true)
        }
        toiletpaperbutton1.backgroundColor = UIColor.purple
    }
    
    
    @IBAction func electronics1Tapped(_ sender: Any) {
        if let username = user.text {
            let db = Firestore.firestore()
            db.collection("users").document(username).setData([
                "electronics": true
            ], merge: true)
        }
        electronicsbutton1.backgroundColor = UIColor.purple
    }
    
    @IBAction func sanitary1Tapped(_ sender: Any) {
        if let username = user.text {
            let db = Firestore.firestore()
            db.collection("users").document(username).setData([
                "sanitary wipes": true
            ], merge: true)
        }
        sanitarybutton1.backgroundColor = UIColor.purple
    }
    
    @IBAction func soap1Tapped(_ sender: Any) {
        if let username = user.text {
            let db = Firestore.firestore()
            db.collection("users").document(username).setData([
                "sanitary wipes": true
            ], merge: true)
        }
        soapbutton1.backgroundColor = UIColor.purple
    }
    
    
    @IBAction func waterbottle1Tapped(_ sender: Any) {
        if let username = user.text {
            let db = Firestore.firestore()
            db.collection("users").document(username).setData([
                "water bottle": true
            ], merge: true)
        }
        waterbutton1.backgroundColor = UIColor.purple
    }
    
    
    @IBAction func lotion1Tapped(_ sender: Any) {
        if let username = user.text {
            let db = Firestore.firestore()
            db.collection("users").document(username).setData([
                "lotion": true
            ], merge: true)
        }
        lotionbutton1.backgroundColor = UIColor.purple
    }
    
    
    @IBAction func handsani1Tapped(_ sender: Any) {
        if let username = user.text {
            let db = Firestore.firestore()
            db.collection("users").document(username).setData([
                "hand sani": true
            ], merge: true)
        }
        handsanibutton1.backgroundColor = UIColor.purple
    }
    
    @IBAction func paperTowel1Tapped(_ sender: Any) {
        if let username = user.text {
            let db = Firestore.firestore()
            db.collection("users").document(username).setData([
                "paper towel": true
            ], merge: true)
        }
        papertowelsbutton1.backgroundColor = UIColor.purple
    }
    
    
    @IBAction func cannedfood1Tapped(_ sender: Any) {
        if let username = user.text {
            let db = Firestore.firestore()
            db.collection("users").document(username).setData([
                "canned food": true
            ], merge: true)
        }
        cannedfoodbutton1.backgroundColor = UIColor.purple
    }
    
    
    @IBAction func chapstick1Tapped(_ sender: Any) {
        if let username = user.text {
            let db = Firestore.firestore()
            db.collection("users").document(username).setData([
                "chapstick": true
            ], merge: true)
        }
        chapstickbutton1.backgroundColor = UIColor.purple
    }
    
    
    @IBAction func haveTapped(_ sender: Any) {
        
    }
    

}
