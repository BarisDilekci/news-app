//
//  TabCoordinator.swift
//  NewsApp
//
//  Created by Barış Dilekçi on 11.10.2024.
//

import SwiftUI

struct TabCoordinator: View {
    var body: some View {
            TabView {
                NavigationView {
                    HomeView()
                }
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }

                NavigationView {
                    SportsView()
                }
                .tabItem {
                    Label("Sport", systemImage: "sportscourt")
                }
                
                NavigationView {
                    TechnologyView()
                }
                .tabItem {
                    Label("Technology", systemImage: "laptopcomputer") 
                }

                NavigationView {
                    FavoriteView()
                }
                .tabItem {
                    Label("Favorite", systemImage: "star")
                }
            }
            .tabViewStyle(DefaultTabViewStyle())


        }
    }


#Preview {
    TabCoordinator()
}

