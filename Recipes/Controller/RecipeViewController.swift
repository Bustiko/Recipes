//
//  RecipeViewController.swift
//  Recipes
//
//  Created by Buse Karabıyık on 18.07.2023.
//

import UIKit

class RecipeViewController: UIViewController {
    
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeCusine: UILabel!
    @IBOutlet weak var recipeTime: UILabel!
    @IBOutlet weak var recipeIngredients: UILabel!
    
    var recipeManager = RecipeManager()
    var imageModel = FetchImageModel()
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor(red: 1.00, green: 0.95, blue: 0.89, alpha: 1.00)
        recipeManager.delegate = self
        recipeManager.performRequest()
    }
}

extension RecipeViewController: RecipeManagerDelegate {
    
    func didUpdateRecipes(_ recipeManager: RecipeManager, recipes: RecipeModel) {
        
          print(recipes.readyInMinutes)
          let hours = recipes.readyInMinutes / 60
          let minutes = recipes.readyInMinutes % 60
//        let hoursAsString = String(format: "%.2f", hours)
        
        
        let imageURLString = recipes.image.absoluteString
        
        DispatchQueue.main.async {
            self.imageModel.setImage(imageURLString, imageView: self.recipeImage)
    
            self.recipeName.text = recipes.title

            if recipes.cuisines.count != 0{
                self.recipeCusine.text = "Cuisine: \(recipes.cuisines[0])"
            } else {
                self.recipeCusine.text = "Cuisine: unknown"
            }
            
            
            if minutes != 0 && hours != 0 {
                self.recipeTime.text = String("Prepared in \(hours) hours \(minutes) minutes")
            } else if hours == 0 {
                self.recipeTime.text = String("Prepared in \(minutes) minutes")
            } else {
                switch hours {
                case 1: self.recipeTime.text = String("Prepared in \(hours) hour")
                default:
                    self.recipeTime.text = String("Prepared in \(hours) hours")
                }
            }
            
            
            for ingredient in recipes.ingredients{
                if(ingredient != ""){
                    self.recipeIngredients.text?.append("\(ingredient) \n ")
                }
            }
        }

    }
    

    func didFailWithError(error: Error) {

    }
}

