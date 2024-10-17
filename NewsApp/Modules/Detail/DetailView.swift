//
//  DetailView.swift
//  NewsApp
//
//  Created by Barış Dilekçi on 17.10.2024.
//

import SwiftUI

struct DetailView: View {
    var article: Article

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Article Title
                Text(article.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.bottom, 5)

                // Author Information
                if let author = article.author {
                    Text("By \(author)")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }

                // Article Image
                if let imageUrl = article.urlToImage, let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { image in
                        image.resizable()
                             .aspectRatio(contentMode: .fit)
                             .cornerRadius(12)
                             .shadow(radius: 5)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 250)
                    .padding(.bottom, 10)
                }

                // Article Description
                Text(article.description ?? "No description available.")
                    .font(.body)
                    .foregroundColor(.primary)
                    .lineLimit(nil)

                // Read More Link
                Link("Read more", destination: URL(string: article.url)!)
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding(.top, 10)
            }
            .padding()
        }
        .navigationTitle("Article Details")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(UIColor.systemBackground))
    }
}
