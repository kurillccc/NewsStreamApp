//
//  NetworkManager.swift
//  NewsStreamApp
//
//  Created by Кирилл on 13.02.2026.
//

import Foundation

final class NetworkManager {
    
    // MARK: - Properties
    static let shared = NetworkManager()
    private let urlNews = "https://newsapi.org/v2/everything?q=tesla&from=2026-01-13&sortBy=publishedAt&apiKey=1a47580d61624c66802776bd25685dc9"
    private let decoder = JSONDecoder()
    
    // MARK: - Initializer
    private init() {
        decoder.dateDecodingStrategy = .iso8601
    }
    
    // MARK: - Methods
    func getNews() async throws -> News {
        
        guard let url = URL(string: urlNews) else { throw NetworkError.invalidURL }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        do {
            return try decoder.decode(News.self, from: data)
        } catch {
            throw NetworkError.invalidData
        }
    }
    
}
