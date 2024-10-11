//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Barış Dilekçi on 11.10.2024.
//

import SwiftUI

@main
struct NewsAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
