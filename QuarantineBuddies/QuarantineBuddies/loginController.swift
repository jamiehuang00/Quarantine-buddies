//
//  loginController.swift
//  QuarantineBuddies
//
//  Created by Jamie Huang on 9/11/20.
//  Copyright © 2020 Jamie Huang. All rights reserved.
//

import Foundation

import UIKit
import Firebase

class loginController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signIn: UIButton!
    @IBOutlet weak var confirmpassword: UITextField!
    @IBOutlet weak var forgot: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func changeLabel(_ sender: Any) {
        if segment.selectedSegmentIndex == 1 {
            label.text = "Signup"
            confirmpassword.isHidden = false
            signIn.titleLabel?.text = "SIGNUP"
            forgot.isHidden = true
        }
        else {
            label.text = "Log in"
            confirmpassword.isHidden = true
            signIn.titleLabel?.text = "LOGIN"
            forgot.isHidden = false
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//           self.view.endEditing(true)
//           // dismiss the keyboard when the veiw is tapped on
           username.resignFirstResponder()
           password.resignFirstResponder()
       }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
    }
    
    
    
    
}
