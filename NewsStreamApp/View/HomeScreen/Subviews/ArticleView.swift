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
    
    let cornerRadius: CGFloat = 10
    
    // MARK: - Body
    var body: some View {
        VStack {
            if let url = article.urlToImage, let imageURL = URL(string: url) {
                AsyncImage(url: imageURL) { phase in
                    switch phase {
                    case .empty:
                        placeholder
                            .frame(width: imageWidth, height: imageHeight)
                            .cornerRadius(cornerRadius)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: imageWidth, height: imageHeight)
                            .cornerRadius(cornerRadius)
                    case .failure(_):
                        placeholder
                            .frame(width: imageWidth, height: imageHeight)
                            .cornerRadius(cornerRadius)
                    @unknown default:
                        placeholder
                            .frame(width: imageWidth, height: imageHeight)
                            .cornerRadius(cornerRadius)
                    }
                }
            } else {
                placeholder
                    .frame(width: imageWidth, height: imageHeight)
                    .cornerRadius(cornerRadius)
            }
            
            VStack(alignment: .leading) {
                TitleView(article: article)
                
                Spacer()
                
                DateView(article: article)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(width: width, height: height)
        .padding(10)
        .background(.background)
        .cornerRadius(cornerRadius)
    }
    
}

