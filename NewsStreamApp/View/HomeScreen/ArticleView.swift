//
//  ArticleView.swift
//  NewsStreamApp
//
//  Created by Кирилл on 15.02.2026.
//

import Foundation
import SwiftUI

struct ArticleView: View {
    
    // MARK: - Properties
    let article: Article
    let placeholder: AnyView
    
    let imageWidth: CGFloat
    let imageHeight: CGFloat
    
    let width: CGFloat
    let height: CGFloat

    
    // MARK: - Body
    var body: some View {
        VStack {
            if let url = article.urlToImage, let imageURL = URL(string: url) {
                AsyncImage(url: imageURL) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: imageWidth, height: imageHeight)
                            .cornerRadius(10)
                    } else { placeholder }
                }
            } else { placeholder }
            
            VStack(alignment: .leading) {
                Text(article.title)
                    .titleFont()
                
                Spacer()
                
                Text(article.publishedAt.convertDate())
                    .descriptionFont()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(width: width, height: height)
        .padding(10)
        .background(.background)
        .cornerRadius(10)
    }
    
}
