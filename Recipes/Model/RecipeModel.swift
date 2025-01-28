//
//  RecipeModel.swift
//  Recipes
//
//  Created by Buse Karabıyık on 16.07.2023.
//

import Foundation

struct RecipeModel {
    let title: String
    let cuisines: [String]
    let readyInMinutes: Int
    let image: URL
    let ingredients: [String]
    let summary: String
    let instructions: String

}
