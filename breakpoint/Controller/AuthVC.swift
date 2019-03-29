//
//  AuthVC.swift
//  breakpoint
//
//  Created by Austin Rightnowar on 3/26/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import UIKit
import Firebase

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            dismiss(animated: true, completion: nil)
        }
    }
    
    // A C T I O N S
    
    @IBAction func signInWithEmailBtnWasPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
    }
    @IBAction func googleSignInBtnWasPressed(_ sender: Any) {
        
    }
    @IBAction func facebookSignInBtnWasPressed(_ sender: Any) {
        
    }
    
    // A C T I O N S
    
    
}
