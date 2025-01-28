//
//  ViewController.swift
//  Recipes
//
//  Created by Buse Karabıyık on 14.07.2023.
//

import UIKit
import FirebaseAuth

class WelcomePageController: UIViewController {
    
    var logInPageController = LogInPageController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if logInPageController.isLoggedIn {
            performSegue(withIdentifier: "WelcomeToMagicPizza", sender: self)
        }
        
        
        view.backgroundColor = UIColor(red: 1.00, green: 0.95, blue: 0.89, alpha: 1.00)
        
    }


}

