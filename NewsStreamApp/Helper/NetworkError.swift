//
//  NetworkError.swift
//  NewsStreamApp
//
//  Created by Кирилл on 13.02.2026.
//

import Foundation

enum NetworkError: String, Error {
    case invalidURL = "Invalid URL"
    case invalidResponse = "Invalid response from the server"
    case invalidData = "Invalid data from the server"
}
