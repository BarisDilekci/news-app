//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Barış Dilekçi on 11.10.2024.
//


//BASE_URL : https://newsapi.org/v2/
//PATH : top-headlines?country=us
//KEY : &apiKey=02592f307fce4acbb3890967aba7aedc

// https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=02592f307fce4acbb3890967aba7aedc

// category = sports, business , technology , science , health

import Foundation

enum URLPath {
    case topHeadlines
    case topHeadlinesByCategory
    
    var rawValue: String {
        switch self {
        case .topHeadlines:
            return "top-headlines"
        case .topHeadlinesByCategory:
            return "top-headlines" // Burada aynı path kullanılıyor, kategori sorgu parametresi olacak
        }
    }
}
struct NetworkRequest {
    let method: HTTPMethod
    let url: URL
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private let baseUrl: URL?
    private let apiKey: String
    
     init() {
        self.baseUrl = URL(string: "https://newsapi.org/v2/")
        self.apiKey = "02592f307fce4acbb3890967aba7aedc"
        
        guard self.baseUrl != nil else {
            fatalError("Invalid base URL")
        }
    }
    
    func buildURL(urlPath: URLPath, country: String = "us", category: String? = nil) -> URL? {
        guard let baseUrl = baseUrl else {
            return nil
        }
        
        var url = baseUrl.appendingPathComponent(urlPath.rawValue)
        
        var queryItems: [URLQueryItem] = []
        
        // Ülke parametresi
        queryItems.append(URLQueryItem(name: "country", value: country))
        
        // Kategori parametresi
        if urlPath == .topHeadlinesByCategory, let category = category {
            queryItems.append(URLQueryItem(name: "category", value: category))
        }
        
        // API Anahtarı
        queryItems.append(URLQueryItem(name: "apiKey", value: apiKey))
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = queryItems
        
        return urlComponents?.url
    }
}

extension NetworkRequest {
    enum HTTPMethod: String {
        case get = "GET"
    }
}

