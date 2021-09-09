//
//  NetworkHelperManager.swift
//  Hops-Hackaton
//
//  Created by Kary Martinez on 2/16/21.
//  Copyright © 2021 Kary Martinez. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

class NetworkHelper {
    
    static let manager = NetworkHelper()
    
    func performDataTask(withUrl url: URL, andHTTPBody body: Data? = nil, andMethod httpMethod: HTTPMethod, completionHandler: @escaping ((Result<Data, AppErrors>) -> Void)) {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.httpBody = body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        urlSession.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else {
                    completionHandler(.failure(.noDataReceived))
                    return
                }
                guard let response = response  as? HTTPURLResponse, (200...299) ~= response.statusCode else {
                    completionHandler(.failure(.badstatusCode))
                    return
                }
                if let error = error {
                    let error = error as NSError
                    if error.domain == NSURLErrorDomain && error.code ==
                        NSURLErrorNotConnectedToInternet {
                        completionHandler(.failure(.noInternetConnection))
                        return
                    }else {
                        completionHandler(.failure(.other(rawError: error)))
                        return
                    }
                }
                completionHandler(.success(data))
            }
            
        }.resume()
    }
    
    private let urlSession = URLSession(configuration: URLSessionConfiguration.default)
    private init() {}
}
