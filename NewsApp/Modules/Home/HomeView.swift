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
            VStack(spacing: 0) {
                if viewModel.news.isEmpty {
                    Text("No news available.")
                        .foregroundColor(.gray)
                        .font(.title2)
                        .padding()
                } else {
                    List(viewModel.news, id: \.url) { article in
                        NewsRow(article: article)
                    }
                    .listStyle(.insetGrouped)
                }
            }
            .navigationTitle("News")
            .navigationBarTitleDisplayMode(.automatic)
            .onAppear {
                Task {
                    await viewModel.fetchNews()
                }
            }
        }
    
}


