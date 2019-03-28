//
//  LoginVC.swift
//  breakpoint
//
//  Created by Austin Rightnowar on 3/26/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    // O U T L E T S ------------------------------------------------------
    @IBOutlet weak var emailField: InsetTextField!
    @IBOutlet weak var passwordField: InsetTextField!
    // O U T L E T S ------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
    }
    
    // A C T I O N S ------------------------------------------------
    @IBAction func signInBtnWasPressed(_ sender: Any) {
        if emailField.text != nil && passwordField.text != nil {
            AuthService.instance.loginUser(withEmail: emailField.text!, andPassword: passwordField.text!) { (success, loginError) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                    print("logged in SUCCESS!")
                } else {
                    print(String(describing: loginError?.localizedDescription))
                }
                AuthService.instance.registerUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, userCreationComplete: { (success, registrationError) in
                    if success {
                        AuthService.instance.loginUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, loginComplete: { (success, nil) in
                            self.dismiss(animated: true, completion: nil)
                            print("Successfully registered user!")
                        })
                    } else {
                        print(String(describing: registrationError?.localizedDescription))
                    }
                })
            }
        }
    }
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    // A C T I O N S ------------------------------------------------
}

extension LoginVC: UITextFieldDelegate {
    
}
