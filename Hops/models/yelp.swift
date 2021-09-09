//
//  Makeup.swift
//  Hops-Hackaton
//
//  Created by Kary Martinez on 2/18/21.
//  Copyright © 2021 Kary Martinez. All rights reserved.
//

import Foundation

struct Recipes: Codable {
    let results: [AllResults]
}

struct AllResults: Codable {
    let id: Int
    let title: String
    let readyInMinutes: Int
    let servings: Int
    let image: String
    let imageUrls: [String]?
  //  let itemsinthecart: Double?
}
