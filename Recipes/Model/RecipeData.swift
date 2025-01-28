//
//  RecipeData.swift
//  Recipes
//
//  Created by Buse Karabıyık on 16.07.2023.
//

import Foundation


struct RecipeData: Codable {
    let recipes: [Recipe]
    
}

struct Recipe: Codable {
    let title: String
    let cuisines: [String]
    let readyInMinutes: Int
    let image: URL
    let extendedIngredients: [Ingredient]
    let summary: String
    let instructions: String
}

struct Ingredient: Codable {
    let nameClean: String
}

