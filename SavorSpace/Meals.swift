//
//  Meals.swift
//  SavorSpace
//
//  Created by user250623 on 4/21/24.
//
import Foundation

struct MealResponse: Codable {
    let meals: [Meal]
}

struct Meal: Codable, Identifiable {
    var id: String
    var name: String
    var thumbnail: String
    var ingredients: [String]?   // This is simplified; you might need to handle differently
    var instructions: String?

    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnail = "strMealThumb"
        case ingredients
        case instructions = "strInstructions"
    }
}
