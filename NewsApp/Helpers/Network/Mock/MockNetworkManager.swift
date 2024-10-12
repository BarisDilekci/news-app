//
//  MockNetworkManager.swift
//  NewsApp
//
//  Created by Barış Dilekçi on 12.10.2024.
//

import Foundation

class MockNetworkManager : NetworkManager {
    var mockURL : URL?
    
     override init() {
         super.init()
        }
    
    override func buildURL(urlPath: URLPath, country: String = "us", category: String? = nil) -> URL? {
            return mockURL
        }
}
