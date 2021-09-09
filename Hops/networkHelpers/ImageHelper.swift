//
//  ImageHelper.swift
//  Hops-Hackaton
//
//  Created by Kary Martinez on 2/16/21.
//  Copyright © 2021 Kary Martinez. All rights reserved.
//

import Foundation
import UIKit

class ImageHelper {
    // Singleton instance to have only one instance in the app of the imageCache
    private init() {}
    static let shared = ImageHelper()
    
    func fetchImage(urlString: String, completionHandler: @escaping (Result<UIImage,AppErrors>) -> ()) {
        guard let url = URL(string: urlString) else {
            completionHandler (.failure(.badURL))
            return }

        NetworkHelper.manager.performDataTask(withUrl: url , andMethod: HTTPMethod.get) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                guard let image = UIImage(data: data) else {completionHandler(.failure(.notAnImage))
                    return
                }
                completionHandler(.success(image))
            }
        }
    }
}
