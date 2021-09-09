//
//  ProductsAPIClient.swift
//  Hops-Hackaton
//
//  Created by Kary Martinez on 2/17/21.
//  Copyright © 2021 Kary Martinez. All rights reserved.
//

import Foundation

class ProductsAPIManager {
    
    func getproduct(completion: @escaping (Result<[ProductWrapper], Error>) -> ()) {
    
    let endpointURLString = "https://api.edamam.com/api/nutrition-data?app_id=d85c1eda&app_key=038992a8d1ecd35c7a238541cb835aea&ingr=1%20large%20apple"
    
    guard let url = URL(string: endpointURLString) else {
      print("bad url")
      return
    }
      let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
           if let error = error {
             return completion(.failure(error))
           }
    
           guard let httpResponse = response as? HTTPURLResponse,
                 (200...299).contains(httpResponse.statusCode) else {
             print("bad status code")
             return
           }
           
           if let jsonData = data {
             // convert data to our swift model
             do {
                let news = try JSONDecoder().decode([ProductWrapper].self, from: jsonData)
                completion(.success(news))
                
             } catch {
               // decoding error
               completion(.failure(error))
             }
           }
         }
         dataTask.resume()
       }
}
