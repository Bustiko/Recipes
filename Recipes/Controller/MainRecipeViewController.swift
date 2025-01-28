//
//  MainRecipeViewController.swift
//  Recipes
//
//  Created by Buse Karabıyık on 19.07.2023.
//
import UIKit

class MainRecipeViewController: UIViewController {
    
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeLabel: UILabel!
    @IBOutlet weak var ContentView: UIView!
    
    var recipeManager = RecipeManager()
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor(red: 1.00, green: 0.95, blue: 0.89, alpha: 1.00)
        recipeTitleLabel.text = recipe.title
        recipeLabel.text = recipe.instructions
        
    }
}
