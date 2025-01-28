//
//  RecipeManager.swift
//  Recipes
//
//  Created by Buse Karabıyık on 16.07.2023.
//

import Foundation
import UIKit

protocol RecipeManagerDelegate {
    func didUpdateRecipes(_ recipeManager: RecipeManager, recipes: RecipeModel)
    func didFailWithError(error: Error)
}


struct RecipeManager {
    
    var delegate: RecipeManagerDelegate?
    var headers: [String:String] = [:]
    
    mutating func performRequest() {
        if let apiKey = ProcessInfo.processInfo.environment["API_KEY"] {
            headers = [
                "X-RapidAPI-Key": apiKey,
                "X-RapidAPI-Host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
            ]
        }
        
        startRequest()
    }
    
    private func startRequest() {
        let request = NSMutableURLRequest(url: NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/random?tags=vegetarian%2Cdessert&number=1")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            if let safeData = data, let recipe = parseJSON(safeData) {
                self.delegate?.didUpdateRecipes(self, recipes: recipe)
            }
        }
        dataTask.resume()
    }
    
    func parseJSON(_ recipesData: Data) -> RecipeModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(RecipeData.self, from: recipesData)
            let title = decodedData.recipes[0].title
            let image = decodedData.recipes[0].image
            let cuisine = decodedData.recipes[0].cuisines
            let time = decodedData.recipes[0].readyInMinutes
            var ingredients = [String](repeating: "", count: decodedData.recipes[0].extendedIngredients.count)
            for x in 0...ingredients.count-1 {
                ingredients.append(decodedData.recipes[0].extendedIngredients[x].nameClean)
            }
            let summary = decodedData.recipes[0].summary
            let newSummary = summary.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
            
            let instructions = decodedData.recipes[0].instructions
            let newInstructions = instructions.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
            
            let recipe = RecipeModel(title: title, cuisines: cuisine, readyInMinutes: time, image: image, ingredients: ingredients, summary: newSummary, instructions: newInstructions)
            
            return recipe
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
