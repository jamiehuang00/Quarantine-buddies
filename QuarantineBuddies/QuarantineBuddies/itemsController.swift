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
    //start of what i want buttons
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
    
    //start of what i need buttons
    @IBOutlet weak var masksbutton2: UIButton!
    @IBOutlet weak var glovesbutton2: UIButton!
    @IBOutlet weak var toiletpaperbutton2: UIButton!
    @IBOutlet weak var electronicsbutton2: UIButton!
    @IBOutlet weak var sanitarywipesbutton2: UIButton!
    @IBOutlet weak var soapbutton2: UIButton!
    @IBOutlet weak var waterbottlebutton2: UIButton!
    @IBOutlet weak var lotionbutton2: UIButton!
    @IBOutlet weak var handsanibutton2: UIButton!
    @IBOutlet weak var cannedfoodbutton2: UIButton!
    @IBOutlet weak var papertowelbutton2: UIButton!
    @IBOutlet weak var chapbutton2: UIButton!
    @IBOutlet var needCollection: [UIButton]!

    var user: UITextField!
    var userNeeds = [String]()
    var userHas = [String]()
    
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
        masksbutton1.backgroundColor = UIColor.systemYellow
        userHas.append("masks")
    }
    
    @IBAction func gloves1Tapped(_ sender: Any) {
           if let username = user.text {
               let db = Firestore.firestore()
               db.collection("users").document(username).setData([
                   "gloves": true
               ], merge: true)
           }
        glovesbutton1.backgroundColor = UIColor.systemYellow
        userHas.append("gloves")
       }
    
    
    @IBAction func toiletpaper1Tapped(_ sender: Any) {
        if let username = user.text {
            let db = Firestore.firestore()
            db.collection("users").document(username).setData([
                "toilet paper": true
            ], merge: true)
        }
        toiletpaperbutton1.backgroundColor = UIColor.systemYellow
        userHas.append("toilet paper")
    }
    
    
    @IBAction func electronics1Tapped(_ sender: Any) {
        if let username = user.text {
            let db = Firestore.firestore()
            db.collection("users").document(username).setData([
                "electronics": true
            ], merge: true)
        }
        electronicsbutton1.backgroundColor = UIColor.systemYellow
        userHas.append("electronics")
    }
    
    @IBAction func sanitary1Tapped(_ sender: Any) {
        if let username = user.text {
            let db = Firestore.firestore()
            db.collection("users").document(username).setData([
                "sanitary wipes": true
            ], merge: true)
        }
        sanitarybutton1.backgroundColor = UIColor.systemYellow
        userHas.append("sanitary wipes")
    }
    
    @IBAction func soap1Tapped(_ sender: Any) {
        if let username = user.text {
            let db = Firestore.firestore()
            db.collection("users").document(username).setData([
                "soap": true
            ], merge: true)
        }
        soapbutton1.backgroundColor = UIColor.systemYellow
        userHas.append("soap")
    }
    
    
    @IBAction func waterbottle1Tapped(_ sender: Any) {
        if let username = user.text {
            let db = Firestore.firestore()
            db.collection("users").document(username).setData([
                "water bottle": true
            ], merge: true)
        }
        waterbutton1.backgroundColor = UIColor.systemYellow
        userHas.append("water bottle")
    }
    
    
    @IBAction func lotion1Tapped(_ sender: Any) {
        if let username = user.text {
            let db = Firestore.firestore()
            db.collection("users").document(username).setData([
                "lotion": true
            ], merge: true)
        }
        lotionbutton1.backgroundColor = UIColor.systemYellow
        userHas.append("lotion")
    }
    
    
    @IBAction func handsani1Tapped(_ sender: Any) {
        if let username = user.text {
            let db = Firestore.firestore()
            db.collection("users").document(username).setData([
                "hand sani": true
            ], merge: true)
        }
        handsanibutton1.backgroundColor = UIColor.systemYellow
        userHas.append("hand sani")
    }
    
    @IBAction func paperTowel1Tapped(_ sender: Any) {
        if let username = user.text {
            let db = Firestore.firestore()
            db.collection("users").document(username).setData([
                "paper towel": true
            ], merge: true)
        }
        papertowelsbutton1.backgroundColor = UIColor.systemYellow
        userHas.append("paper towel")
    }
    
    
    @IBAction func cannedfood1Tapped(_ sender: Any) {
        if let username = user.text {
            let db = Firestore.firestore()
            db.collection("users").document(username).setData([
                "canned food": true
            ], merge: true)
        }
        cannedfoodbutton1.backgroundColor = UIColor.systemYellow
        userHas.append("canned food")
    }
    
    
    @IBAction func chapstick1Tapped(_ sender: Any) {
        if let username = user.text {
            let db = Firestore.firestore()
            db.collection("users").document(username).setData([
                "chapstick": true
            ], merge: true)
        }
        chapstickbutton1.backgroundColor = UIColor.systemYellow
        userHas.append("chapstick")
    }
    
    
    @IBAction func masks2Tapped(_ sender: Any) {
        if let username = user.text {
                   let db = Firestore.firestore()
                   db.collection("users").document(username).setData([
                       "masks": false
                   ], merge: true)
               }
               masksbutton2.backgroundColor = UIColor.systemYellow
        userNeeds.append("masks")
    }
    
    
    @IBAction func gloves2Tapped(_ sender: Any) {
        if let username = user.text {
                   let db = Firestore.firestore()
                   db.collection("users").document(username).setData([
                       "gloves": false
                   ], merge: true)
               }
               glovesbutton2.backgroundColor = UIColor.systemYellow
        userNeeds.append("gloves")
    }
    
    @IBAction func toiletpaper2Tapped(_ sender: Any) {
        if let username = user.text {
               let db = Firestore.firestore()
               db.collection("users").document(username).setData([
                   "toilet paper": false
               ], merge: true)
           }
           toiletpaperbutton2.backgroundColor = UIColor.systemYellow
        userNeeds.append("toilet paper")
    }
    
    
    @IBAction func electronics2Tapped(_ sender: Any) {
        if let username = user.text {
                      let db = Firestore.firestore()
                      db.collection("users").document(username).setData([
                          "electronics": false
                      ], merge: true)
                  }
                  electronicsbutton2.backgroundColor = UIColor.systemYellow
        userNeeds.append("electronics")
    }
    
    
    @IBAction func sanitary2Tapped(_ sender: Any) {
        if let username = user.text {
                             let db = Firestore.firestore()
                             db.collection("users").document(username).setData([
                                 "sanitary wipes": false
                             ], merge: true)
                         }
                         sanitarywipesbutton2.backgroundColor = UIColor.systemYellow
        userNeeds.append("sanitary wipes")
        
    }
    
    
    @IBAction func soap2Tapped(_ sender: Any) {
        if let username = user.text {
                             let db = Firestore.firestore()
                             db.collection("users").document(username).setData([
                                 "soap": false
                             ], merge: true)
                         }
                         soapbutton2.backgroundColor = UIColor.systemYellow
        userNeeds.append("soap")
    }
    
    
    @IBAction func waterbottle2Tapped(_ sender: Any) {
        if let username = user.text {
            let db = Firestore.firestore()
            db.collection("users").document(username).setData([
                "water bottle": false
            ], merge: true)
        }
        waterbottlebutton2.backgroundColor = UIColor.systemYellow
        userNeeds.append("water bottle")
    }
    
    
    @IBAction func lotion2Tapped(_ sender: Any) {
        if let username = user.text {
            let db = Firestore.firestore()
            db.collection("users").document(username).setData([
                "lotion": false
            ], merge: true)
        }
        lotionbutton2.backgroundColor = UIColor.systemYellow
        userNeeds.append("lotion")
    }
    
    
    @IBAction func handsani2Tapped(_ sender: Any) {
        if let username = user.text {
            let db = Firestore.firestore()
            db.collection("users").document(username).setData([
                "hand sani": false
            ], merge: true)
        }
        handsanibutton2.backgroundColor = UIColor.systemYellow
        userNeeds.append("hand sani")
    }
    
    
    @IBAction func papertowel2Tapped(_ sender: Any) {
        if let username = user.text {
            let db = Firestore.firestore()
            db.collection("users").document(username).setData([
                "paper towel": false
            ], merge: true)
        }
        papertowelbutton2.backgroundColor = UIColor.systemYellow
        userNeeds.append("paper towel")
    }
    
    @IBAction func cannedfood2Tapped(_ sender: Any) {
        if let username = user.text {
            let db = Firestore.firestore()
            db.collection("users").document(username).setData([
                "canned food": false
            ], merge: true)
        }
        cannedfoodbutton2.backgroundColor = UIColor.systemYellow
        userNeeds.append("canned food")
    }
    
    @IBAction func chapstick2Tapped(_ sender: Any) {
        if let username = user.text {
                let db = Firestore.firestore()
                db.collection("users").document(username).setData([
                    "chapstick": false
                ], merge: true)
            }
            chapbutton2.backgroundColor = UIColor.systemYellow
        userNeeds.append("chapstick")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! matchController
        vc.username = user
        vc.selfHas = userHas
        vc.selfNeeds = userNeeds
    }
    
}
