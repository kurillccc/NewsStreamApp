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
    
    private let apiKey = "5a366c83721a4fa487096e11ebb7d3e3"
    private let decoder = JSONDecoder()
    
    // MARK: - Initializer
    private init() {
        decoder.dateDecodingStrategy = .iso8601
    }
    
    // MARK: - Methods
    func getNews(urlString: String) async throws -> News {
        
        guard let url = URL(string: urlString + apiKey)  else { throw NetworkError.invalidURL }
        
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
