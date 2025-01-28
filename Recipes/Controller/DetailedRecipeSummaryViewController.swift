//
//  RecipeViewController.swift
//  Recipes
//
//  Created by Buse Karabıyık on 17.07.2023.
//

import UIKit

class DetailedRecipeSummaryViewController: UIViewController {
    
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeLabel: UILabel!
    
    var recipeManager = RecipeManager()
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor(red: 1.00, green: 0.95, blue: 0.89, alpha: 1.00)
        recipeTitleLabel.text = recipe.title
        recipeLabel.text = recipe.summary
       
    }
}


