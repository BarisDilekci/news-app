//
//  NewsAppTests.swift
//  NewsAppTests
//
//  Created by Barış Dilekçi on 11.10.2024.
//

import XCTest
@testable import NewsApp

struct MyDataType: Codable {
    let key: String
}


final class NewsAppTests: XCTestCase {
    
    var mockSession: MockURLSession!
    var client : Client!
    var mockNetworkManager : MockNetworkManager!
    
    override func setUpWithError() throws {
        mockSession = MockURLSession()
        client = Client(session: mockSession)
        mockNetworkManager = MockNetworkManager()

    }
    
    override func tearDownWithError() throws {
        mockSession = nil
        client = nil
        mockNetworkManager = nil
    }
    
    //MARK: - SESSION TEST
    func test_fetch_success() async {
        let mockData = """
        { "key": "value" }
        """.data(using: .utf8)
        
        let mockResponse = HTTPURLResponse(url: URL(string: "https://api.example.com")!,
                                           statusCode: 200,
                                           httpVersion: nil,
                                           headerFields: nil)
        
        mockSession.data = mockData
        mockSession.response = mockResponse
        
        do {
            let request = URLRequest(url: URL(string: "https://api.example.com")!)
            let result: MyDataType = try await client.fetch(type: MyDataType.self, with: request)
            XCTAssertEqual(result.key, "value")
        } catch {
            XCTFail("Beklenmeyen hata: \(error)")
        }
    }
    
    func test_fetch_error_invalid_response() async {
        mockSession.response = URLResponse()
        let request = URLRequest(url: URL(string: "https://api.example.com")!)
        
        do {
            _ = try await client.fetch(type: MyDataType.self, with: request)
            XCTFail("Hata bekleniyordu ama başarılı oldu.")
        } catch let apiError as APIError {
            XCTAssertEqual(apiError, APIError.requestFailed(description: "Invalid Response"))
        } catch {
            XCTFail("Beklenmeyen hata: \(error)")
        }
    }
    
    //MARK: - NETWORK MANAGER TEST
    func test_fetch_for_top_headlines() async  {
        let apiKey = "02592f307fce4acbb3890967aba7aedc"
        let expectedURL = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(apiKey)")
        mockNetworkManager.mockURL = expectedURL
        
        let url = mockNetworkManager.buildURL(urlPath: .topHeadlines)
        
        XCTAssertEqual(url, expectedURL)
        
    }
    func test_fetch_for_category() async  {
        let apiKey = "02592f307fce4acbb3890967aba7aedc"
        let category = "sports"
        let expectedURL = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=\(category)&apiKey=\(apiKey)")
        
        mockNetworkManager.mockURL = expectedURL
        
        let url = mockNetworkManager.buildURL(urlPath: .topHeadlinesByCategory)
        
        XCTAssertEqual(url, expectedURL)
    }
    
    func test_failed_for_top_headlines() async  {
        let apiKey = "02592f307fce4acbb3890967aba7aedc"
        let expectedURL = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(apiKey)")
        mockNetworkManager.mockURL = expectedURL
        
        let url = mockNetworkManager.buildURL(urlPath: .topHeadlines)
        
        XCTAssertEqual(url, expectedURL)
    }
    
    func test_failed_for_category() async  {
        let apiKey = "02592f307fce4acbb3890967aba7aedc"
        let category = "sportsss"
        let expectedURL = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=\(category)&apiKey=\(apiKey)")
        
        mockNetworkManager.mockURL = expectedURL
        
        let url = mockNetworkManager.buildURL(urlPath: .topHeadlinesByCategory)
        
        XCTAssertEqual(url, expectedURL)
    }
}
