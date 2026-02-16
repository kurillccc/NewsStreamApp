//
//  TitleView.swift
//  NewsStreamApp
//
//  Created by Кирилл on 16.02.2026.
//

import SwiftUI

struct TitleView: View {
    
    // MARK: - Properties
    let article: Article
    
    // MARK: - Body
    var body: some View {
        Text(article.title)
            .titleFont()
    }
    
}
