//
//  NewsSlider.swift
//  NewsApp
//
//  Created by Barış Dilekçi on 11.10.2024.
//

import SwiftUI

struct NewsSlider: View {
    // Örnek haber verileri
    let newsItems: [NewsItem] = [
        NewsItem(title: "Haber 1", image: "image1"),
        NewsItem(title: "Haber 2", image: "image2"),
        NewsItem(title: "Haber 3", image: "image3"),
    ]
    
    var body: some View {
        TabView {
            ForEach(newsItems) { item in
                VStack {
                    Image(item.image)
                        .resizable()
                        .scaledToFill() 
                        .frame(height: 200)
                        .cornerRadius(15)
                    
                    Text(item.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top, 8)
                        .padding(.bottom, 16)
                        .foregroundColor(.primary)
                }
                .padding(.horizontal)
                .padding(.bottom)
                .cornerRadius(15)
                .padding(.horizontal)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .frame(height: 250)
    }
}

struct NewsItem: Identifiable {
    let id = UUID()
    let title: String
    let image: String
}

