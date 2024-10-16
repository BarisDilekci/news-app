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
            VStack(alignment: .leading, spacing: 16) {
                Text(article.title)
                    .font(.title)
                    .fontWeight(.bold)

                if let author = article.author {
                    Text("By \(author)").font(.subheadline).foregroundColor(.gray)
                }

                if let imageUrl = article.urlToImage, let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { image in
                        image.resizable().aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 200)
                }

                Text(article.description ?? "No description available.").font(.body)

                Link("Read more", destination: URL(string: article.url)!)
                    .foregroundColor(.blue)
            }
            .padding()
        }
        .navigationTitle("Article Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
