//
//  NewsRow.swift
//  NewsApp
//
//  Created by Barış Dilekçi on 12.10.2024.
//

import SwiftUI

struct NewsRow: View {
    let article: Article

    var body: some View {
        HStack(alignment: .top) {
            if let imageUrl = article.urlToImage, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .cornerRadius(4)
                } placeholder: {
                    Color.gray.opacity(0.2)
                        .frame(width: 80, height: 80)
                        .cornerRadius(4)
                }
            }
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.primary)
                    .lineLimit(3)
                Text(article.description ?? "No description")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                    .truncationMode(.tail)
            }
            .padding(.leading, 8)
        }
        .padding(.vertical, 8)
    }
}

