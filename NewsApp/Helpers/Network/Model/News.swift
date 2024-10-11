//
//  News.swift
//  NewsApp
//
//  Created by Barış Dilekçi on 11.10.2024.
//

import Foundation

// MARK: - Welcome
struct News : Codable {
    var status: String
    var totalResults: Int
    var articles: [Article]
}

// MARK: - Article
struct Article : Codable {
    var source: Source
    var author: String?
    var title, description: String
    var url: String
    var urlToImage: String?
    var publishedAt: String
    var content: String?
}

// MARK: - Source
struct Source : Codable{
    var id: String?
    var name: String
}
