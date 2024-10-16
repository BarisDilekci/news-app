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
                        .frame(width: 70, height: 70)
                        .cornerRadius(4)
                }
            }
            VStack(alignment: .center) {
                Text(article.title)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.primary)
            }
            .padding(.leading, 8)
        }
        .padding(.vertical, 8)
    }
}

