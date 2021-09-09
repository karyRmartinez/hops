//
//  APIClient.swift
//  Hops-Hackaton
//
//  Created by Kary Martinez on 2/16/21.
//  Copyright © 2021 Kary Martinez. All rights reserved.
//

import Foundation

class NewsAPIManager {
    
    func getNews(completion: @escaping (Result<[Article], Error>) -> ()) {
    
    let endpointURLString = "http://newsapi.org/v2/everything?q=vegan&from=2021-03-17&sortBy=english&totalResults=10&apiKey=\( .NewsAPIKey)"
    
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
                let news = try JSONDecoder().decode(NewsWrapper.self, from: jsonData)
                completion(.success(news.articles))
                
             } catch {
               // decoding error
               completion(.failure(error))
             }
           }
         }
         dataTask.resume()
       }
}
