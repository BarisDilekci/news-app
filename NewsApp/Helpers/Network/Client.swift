//
//  Client.swift
//  NewsApp
//
//  Created by Barış Dilekçi on 11.10.2024.
//

import Foundation


final class Client: GenericAPI {
    var session: URLSessionProtocol
    
    init(session: URLSessionProtocol) {
        self.session = session
    }
    
    convenience init() {
        self.init(session: URLSession(configuration: .default))
    }
}
