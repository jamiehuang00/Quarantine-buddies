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
    @IBOutlet weak var error: UILabel!
    
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
            username.isHidden = false
            forgot.isHidden = false
            prevUser = false
        }
        else {
            label.text = "Log in"
            confirmpassword.isHidden = true
            signIn.titleLabel?.text = "LOGIN"
            forgot.isHidden = false
            username.isHidden = true
            prevUser = true
        }
    }
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        if !(email.hasText && password.hasText) {
            self.error.text = "Missing email and/or password"
            self.error.isHidden = false
            
        }
        if let emailLiteral = email.text, let passwordLiteral = password.text {
        
        if prevUser {
            Auth.auth().signIn(withEmail: emailLiteral , password: passwordLiteral) { (user, error) in
                if user != nil {
                    self.id = emailLiteral
                    self.performSegue(withIdentifier: "toItems", sender: self)
                    let vcm = self.storyboard?.instantiateViewController(identifier: "itemsController")
                    self.present(vcm!, animated: true)
                    print("True")
                }
                else {
                    //error
                }
            }
        }
            
        else {
            if segment.selectedSegmentIndex == 1 && !(username.hasText) {
                self.error.text = "Missing username"
            }
            else if segment.selectedSegmentIndex == 1 && !(confirmpassword.hasText) {
                self.error.text = "Please confirm password"
            }
            else if password.text != confirmpassword.text {
                self.error.text = "Passwords don't match"
            }
            Auth.auth().createUser(withEmail: emailLiteral, password: passwordLiteral) { (user, error) in
                if user != nil {
                    self.id = emailLiteral
                    self.performSegue(withIdentifier: "toItems", sender: self)
                    print("False")
                }
                else {
                    //error
                }
            }
        }
        }
    }
    
    @IBAction func forgetPasswordTapped(_ sender: Any) {
        if email.hasText {
            if let email1 = email.text {
                Auth.auth().sendPasswordReset(withEmail: email1) { error in
                    if error != nil {
                        self.error.text = "Email doesn't exist"
                    }
                    else {
                        self.error.text = "Reset successful"
                    }
                }
            }
        }
        else {
            self.error.text = "Please enter email"
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! itemsController
        vc.user = username
    }
    
}
