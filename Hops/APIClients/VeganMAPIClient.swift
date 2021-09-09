//
//  VeganMakeuoAPIClient.swift
//  Hops-Hackaton
//
//  Created by Kary Martinez on 2/18/21.
//  Copyright © 2021 Kary Martinez. All rights reserved.
//

import Foundation

class RecipesAPIManager {
    private init() {}
    static let manager = RecipesAPIManager()
    
    func getRecipes(searchString: String, completionHandler: @escaping (Result<[AllResults], AppErrors>) -> Void) {
        
        let urlString =
      "https://api.spoonacular.com/recipes/search?query=\(searchString)&diet=vegan&number=100&apiKey=4931392f631a41c2b7a964b6ec7cbc81"
        print(urlString)
        guard let url = URL(string: urlString)else {
            completionHandler(.failure(.badURL))
            return
        }
        
        //network helper manager
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let AzureOverAllData = try JSONDecoder().decode(Recipes.self, from: data)
                    completionHandler(.success(AzureOverAllData.results))
                }catch{
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
}
  
