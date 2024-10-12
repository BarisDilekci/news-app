//
//  TechnologyViewModel.swift
//  NewsApp
//
//  Created by Barış Dilekçi on 12.10.2024.
//

import Foundation

@MainActor
final class TechnologyViewModel: ObservableObject {
    @Published var news: [Article] = []
    
    private let client: Client
    private let networkManager: NetworkManager
    
    init(client: Client = Client()) {
        self.client = client
        self.networkManager = NetworkManager.shared
    }
    
    func fetchTechnologyNews() async {
        guard let url = networkManager.buildURL(urlPath: .topHeadlinesByCategory, country: "us", category: "technology") else {
            print("Failed to build URL")
            return
        }
        
        print("Fetching URL: \(url)") // URL'yi kontrol et

        var request = URLRequest(url: url)
        request.httpMethod = NetworkRequest.HTTPMethod.get.rawValue
        
        do {
            let newsResponse: News = try await client.fetch(type: News.self, with: request)
            news = newsResponse.articles
        } catch {
            print("Error fetching news: \(error.localizedDescription)")
        }
    }

}
