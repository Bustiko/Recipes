//
//  LogInPageController.swift
//  Recipes
//
//  Created by Buse Karabıyık on 15.07.2023.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import SafariServices

class LogInPageController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let googleAuthModel = GoogleAuthModel()
    
    private let defaults = UserDefaults.standard
    
    var isLoggedIn: Bool {
        get {
            return defaults.bool(forKey: "IsLoggedIn")
        }
        set {}
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor(red: 1.00, green: 0.95, blue: 0.89, alpha: 1.00)
    }
    
    
    @IBAction func logInButtonPressed(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                self.performSegue(withIdentifier: "LogInToMagicPizza", sender: self)
                self.defaults.set(true, forKey: "IsLoggedIn")
            }
        } else {
            return
        }
        
    }
    
    
    
    @IBAction func googleSignInPressed(_ sender: UIButton) {
        
        googleAuthModel.authGoogleUser(view: self)
        
    }
    

}


