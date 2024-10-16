//
//  NewsRow.swift
//  NewsApp
//
//  Created by Barış Dilekçi on 12.10.2024.
//

import SwiftUI

struct NewsRow: View {
    let article: Article

    @State private var isImageLoaded: Bool = false

    var body: some View {
        HStack(alignment: .top) {
            if let imageUrl = article.urlToImage, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        Color.gray.opacity(0.2)
                            .frame(width: 100, height: 100)
                            .cornerRadius(4)
                            .transition(.scale)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .cornerRadius(4)
                            .onAppear {
                                withAnimation(.easeIn) {
                                    isImageLoaded = true
                                }
                            }
                            .transition(.scale)
                    case .failure:
                        Color.red
                            .frame(width: 100, height: 100)
                            .cornerRadius(4)
                    @unknown default:
                        EmptyView()
                    }
                }
                .animation(.easeInOut)
            }
            
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.primary)
                    .lineLimit(2)
            }
            .padding(.leading, 8)
        }
        .padding(.vertical, 8)
    }
}
