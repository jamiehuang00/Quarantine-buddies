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
    @IBOutlet weak var email: UITextField!
    
    var prevUser:Bool = true
    var id = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func changeLabel(_ sender: Any) {
        if segment.selectedSegmentIndex == 1 {
            label.text = "Register"
            label.font.withSize(10)
            confirmpassword.isHidden = false
            signIn.titleLabel?.text = "REGISTER"
            email.isHidden = false
            forgot.isHidden = false
            prevUser = false
        }
        else {
            label.text = "Log in"
            confirmpassword.isHidden = true
            signIn.titleLabel?.text = "LOGIN"
            forgot.isHidden = false
            email.isHidden = true
            prevUser = true
        }
    }
    
    func loginButtonPressed (_ sender: UIButton) {
        if let emailLiteral = email.text, let passwordLiteral = password.text {
        
        if prevUser {
            Auth.auth().signIn(withEmail: emailLiteral , password: passwordLiteral) { (user, error) in
                if user != nil {
                    self.id = emailLiteral
                    self.performSegue(withIdentifier: "toItems", sender: self)
                }
                else {
                    //error
                }
            }
        }
            
        else {
            Auth.auth().createUser(withEmail: emailLiteral, password: passwordLiteral) { (user, error) in
                if user != nil {
                    self.id = emailLiteral
                    self.performSegue(withIdentifier: "toItems", sender: self)
                }
                else {
                    //error
                }
            }
        }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//           self.view.endEditing(true)
//           // dismiss the keyboard when the view is tapped on
           username.resignFirstResponder()
           password.resignFirstResponder()
       }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
    }
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! ViewControllerSupplement
    }
    */
    
    
}
