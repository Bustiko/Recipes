//
//  RegisterPageController.swift
//  Recipes
//
//  Created by Buse Karabıyık on 14.07.2023.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class RegisterPageController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let googleAuthModel = GoogleAuthModel()

    let logInPage = LogInPageController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor(red: 1.00, green: 0.95, blue: 0.89, alpha: 1.00)
    }
    
    
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            }
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                self.performSegue(withIdentifier: "SignInToMagicPizza", sender: self)
                self.logInPage.isLoggedIn = true
            }
            
        } else {
            return
        }
        
       
        
    }
    
    
    
    @IBAction func googleSignInPressed(_ sender: UIButton) {
        
        googleAuthModel.authGoogleUser(view: self)
        
    }
            
}
    




