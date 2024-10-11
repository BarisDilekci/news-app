//
//  ContentView.swift
//  NewsApp
//
//  Created by Barış Dilekçi on 11.10.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
                if viewModel.news.isEmpty {
                    Text("No news available.")
                        .foregroundColor(.gray)
                } else {
                    List(viewModel.news, id: \.url) { article in
                        VStack(alignment: .leading) {
                            Text(article.title)
                                .font(.headline)
                            Text(article.description)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("News")
            .onAppear {
                Task {
                    await viewModel.fetchNews()
                }
            }

        
    }
}
