//
//  DetailView.swift
//  NewsStreamApp
//
//  Created by Кирилл on 16.02.2026.
//

import SwiftUI

struct DetailView: View {
    
    // MARK: - Properties
    let article: Article
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            ScrollView(.vertical, showsIndicators: false) {
                MainImageView(article: article)
                
                VStack(alignment: .leading, spacing: 20) {
                    TitleView(article: article)
                    
                    DescriptionView(article: article)
                    
                    DateView(article: article)
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background)
                .background(GradientAvatarView())
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            
            BackButtonView()
                .padding(.leading)
        }
    }
    
}

#Preview {
    DetailView(
        article: Article(
            title: "Example",
            description: "sdafsaf",
            url: "",
            urlToImage: "",
            publishedAt: Date()
        )
    )
}
