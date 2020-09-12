//
//  ViewControllerSupplement.swift
//  QuarantineBuddies
//
//  Created by Anish Kulkarni on 9/12/20.
//  Copyright © 2020 Jamie Huang. All rights reserved.
//

import UIKit

class ViewControllerSupplement: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func next(_ sender: Any) {
        self.performSegue(withIdentifier: "toItems", sender: self)
    }
    
}
