//
//  JsonStruct.swift
//  Hops-Hackaton
//
//  Created by Kary Martinez on 2/16/21.
//  Copyright © 2021 Kary Martinez. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct NewsWrapper: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
//    let source: [Source]?
//    let author, title, articleDescription: String?
   //let articleDescription: String?
    let author: String
    let title: String
    let url: String
    let urlToImage: String?
//    let publishedAt: Date?
   let content: String?

//    enum CodingKeys: String, CodingKey {
//        case  author, title
//        case articleDescription = "description"
//        case urlToImage = "Url To Image"
//        case publishedAt = "published at"
//    }
}

// MARK: - Source
//struct Source: Codable {
//    let id: String?
//    let name: String?
//}
