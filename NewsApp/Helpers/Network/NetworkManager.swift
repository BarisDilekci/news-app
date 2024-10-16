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
            return "top-headlines"
        }
    }
}
struct NetworkRequest {
    let method: HTTPMethod
    let url: URL
}


extension NetworkRequest {
    enum HTTPMethod: String {
        case get = "GET"
    }
}


class NetworkManager {
    static let shared = NetworkManager()
    
    private let baseUrl: URL?
    private let apiKey: String
    
    init() {
           guard let url = URL(string: "https://newsapi.org/v2/") else {
               fatalError(NetworkError.invalidURL.localizedDescription)
           }
           self.baseUrl = url
           self.apiKey = "02592f307fce4acbb3890967aba7aedc"
       }
       
    
    func buildURL(urlPath: URLPath, country: String = "us", category: String? = nil) -> URL? {
        guard let baseUrl = baseUrl else {
            return nil
        }
        
        var url = baseUrl.appendingPathComponent(urlPath.rawValue)
        
        var queryItems: [URLQueryItem] = []
        
        queryItems.append(URLQueryItem(name: "country", value: country))
        
        if urlPath == .topHeadlinesByCategory, let category = category {
            queryItems.append(URLQueryItem(name: "category", value: category))
        }
        
        queryItems.append(URLQueryItem(name: "apiKey", value: apiKey))
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = queryItems
        
        return urlComponents?.url
    }
}
