//
//  MainImageView.swift
//  NewsStreamApp
//
//  Created by Кирилл on 16.02.2026.
//

import SwiftUI

struct MainImageView: View {
    
    // MARK: - Properties
    let article: Article
    
    // MARK: - Body
    var body: some View {
        GeometryReader { reader in
            let placeholder: AnyView = AnyView(
                PlaceholderDetailView(
                    width: SizeConstants.screenWidth,
                    height: SizeConstants.avatarHeight,
                    reader: reader
                )
            )
            if let url = article.urlToImage, let imageURL = URL(string: url) {
                AsyncImage(url: imageURL) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .offset(y: -reader.frame(in: .global).minY)
                            .frame(
                                width: SizeConstants.screenWidth,
                                height: reader
                                    .frame(
                                        in: .global
                                    ).minY + SizeConstants.avatarHeight + 10)
                    } else { placeholder }
                }
            } else { placeholder }
        }
        .frame(height: UIScreen.main.bounds.width)
    }
    
}
