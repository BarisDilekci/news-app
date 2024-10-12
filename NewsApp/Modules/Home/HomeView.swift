//
//  ContentView.swift
//  NewsApp
//
//  Created by Barış Dilekçi on 11.10.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var isLoading: Bool = false

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
                .refreshable {
                    await fetchNews()
                }
            }
        }
        .navigationTitle("News")
        .navigationBarTitleDisplayMode(.automatic)
        .onAppear {
            Task {
                await fetchNews()
            }
        }
        .overlay(
            Group {
                if isLoading {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.white.opacity(0.8))
                }
            }
        )
    }

    private func fetchNews() async {
        isLoading = true
        await viewModel.fetchNews()
        isLoading = false
    }
}

