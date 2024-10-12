//
//  TechnologyView.swift
//  NewsApp
//
//  Created by Barış Dilekçi on 12.10.2024.
//

import SwiftUI

struct TechnologyView: View {
    @StateObject private var viewModel = TechnologyViewModel()
    
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
            .navigationTitle("Tecnology")
            .navigationBarTitleDisplayMode(.automatic)
            .onAppear {
                Task {
                    await viewModel.fetchSportNews()
                }
            }
        }
    
}
#Preview {
    SportsView()
}
