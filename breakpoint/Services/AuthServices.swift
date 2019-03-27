//
//  AuthServices.swift
//  breakpoint
//
//  Created by Austin Rightnowar on 3/27/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    static let instance = AuthService()
    
    func registerUser(withEmail email: String, andPassword password: String, userCreationComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                userCreationComplete(false, error)
                return
            }
            
            
            let userData = ["provider": Auth.auth().currentUser?.providerData, "email" : Auth.auth().currentUser?.email] as [String : Any]
            DataService.instance.createDBUser(uid: (Auth.auth().currentUser?.uid)!, userData: userData)
            userCreationComplete(true, nil)
        }
    }
    
    func loginUser(withEmail email: String, andPassword password: String, loginComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                loginComplete(false, error)
                return
            }
            
            loginComplete(true, nil)
        }
    }
}
