//
//  Products.swift
//  Hops-Hackaton
//
//  Created by Kary Martinez on 2/17/21.
//  Copyright © 2021 Kary Martinez. All rights reserved.
//

import Foundation

// MARK: - Product
struct ProductWrapper: Codable {
    let dietLabels, healthLabels, cautions: [String]
    let ingredients: [Ingredient]
}

// MARK: - Ingredient
struct Ingredient: Codable {
    let text: String
    let parsed: [Parsed]
}

// MARK: - Parsed
struct Parsed: Codable {
    let quantity: Int
    let measure, foodMatch, food, foodID: String
    let weight, retainedWeight: Int
    let nutrients: [String: TotalDaily]
    let measureURI: String
    let status: String

    enum CodingKeys: String, CodingKey {
        case quantity, measure, foodMatch, food
        case foodID = "foodId"
        case weight, retainedWeight, nutrients, measureURI, status
    }
}

// MARK: - TotalDaily
struct TotalDaily: Codable {
    let label: String
    let quantity: Double
}
