//
//  GoogleAuthModel.swift
//  Recipes
//
//  Created by Buse Karabıyık on 15.07.2023.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import SafariServices

struct GoogleAuthModel {
    
    func authGoogleUser(view: UIViewController) {
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        
        GIDSignIn.sharedInstance.signIn(withPresenting: view) { result, error in
            guard error == nil else {
                return
            }
            
            
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)
            
            
            
            Auth.auth().signIn(with: credential) { result, error in
                
            }
            
        }
    }
}
