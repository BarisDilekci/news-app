//
//  News.swift
//  NewsApp
//
//  Created by Barış Dilekçi on 11.10.2024.
//

import Foundation

// MARK: - Welcome
struct News : Codable{
    var status: String
    var totalResults: Int
    var articles: [Article]
}

// MARK: - Article
struct Article : Codable {
    var source: Source
    var author: String?
    var title: String
    var description: String?
    var url: String
    var urlToImage: String?
    var publishedAt: String
    var content: String?
    
    var uniqueId: String {
           return url // URL'yi benzersiz bir anahtar olarak kullanabilirsiniz
       }
}

// MARK: - Source
struct Source : Codable{
    var id: String?
    var name: String
}
