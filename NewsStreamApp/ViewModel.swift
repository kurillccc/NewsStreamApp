//
//  ViewModel.swift
//  NewsStreamApp
//
//  Created by Кирилл on 14.02.2026.
//

import Foundation
internal import Combine

@MainActor
final class ViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var topNews: [Article] = []
    
    init() {
        fetchNews()
    }
    
    // MARK: - Methods
    func fetchNews() {
        Task {
            do {
                let articles = try await NetworkManager.shared.getNews()
                topNews = articles.articles
            } catch {
                if let error = error as?  NetworkError {
                    print(error)
                }
            }
        }
    }
    
}
