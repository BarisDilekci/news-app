//
//  HomeViewModel.swift
//  NewsApp
//
//  Created by Barış Dilekçi on 11.10.2024.
//
import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var news: [Article] = []
    
    private let client: Client
    private let networkManager: NetworkManager
    
    init(client: Client = Client()) {
        self.client = client
        self.networkManager = NetworkManager.shared
    }
    
    func fetchNews() async {
        guard let url = networkManager.buildURL(urlPath: .topHeadlines, country: "us") else {
            return
        }
        print(url)
        
        var request = URLRequest(url: url)
        request.httpMethod = NetworkRequest.HTTPMethod.get.rawValue
        
        do {
            let newsResponse: News = try await client.fetch(type: News.self, with: request)
            news = newsResponse.articles
        } catch {
            print(error.localizedDescription)
        }
    }
}
