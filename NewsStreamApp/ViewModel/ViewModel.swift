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
    @Published var bottomNews: [Article] = []
    
    init() {
        fetchTopNews()
        fetchBottomNews()
    }
    
    // MARK: - Methods
    func fetchTopNews() {
        Task {
            do {
                let articles = try await NetworkManager.shared.getNews(
                    urlString: URLConstants.topBaseURL
                )
                topNews = articles.articles
            } catch {
                if let error = error as?  NetworkError {
                    print(error)
                }
            }
        }
    }
    
    func fetchBottomNews() {
        Task {
            do {
                let articles = try await NetworkManager.shared.getNews(
                    urlString: URLConstants.bottomBaseURL
                )
                bottomNews = articles.articles
            } catch {
                if let error = error as?  NetworkError {
                    print(error)
                }
            }
        }
    }
    
}
