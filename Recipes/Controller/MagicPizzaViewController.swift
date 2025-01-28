//
//  MagicPizzaViewController.swift
//  Recipes
//
//  Created by Buse Karabıyık on 17.07.2023.
//

import UIKit

class MagicPizzaViewController: UIViewController {
    
    override func viewDidLoad() {
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    
    @IBAction func pizzaButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "LuckyPizzaToRecipe", sender: self)
    }
}
