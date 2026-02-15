//
//  ContentView.swift
//  NewsStreamApp
//
//  Created by Кирилл on 13.02.2026.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Properties
    @StateObject private var vm = ViewModel()
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                
                Text("Top News")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.top)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        if vm.topNews.isEmpty {
                            Text("Нет данных")
                                .foregroundStyle(.secondary)
                                .padding()
                        } else {
                            ForEach(vm.topNews, id: \.url) { article in
                                VStack {
                                    if let url = article.urlToImage, let imageURL = URL(string: url) {
                                        AsyncImage(url: imageURL) { phase in
                                            if let image = phase.image {
                                                image
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(height: 150)
                                                    .cornerRadius(10)
                                            }
                                        }
                                    } else {
                                        ZStack {
                                            Rectangle()
                                                .frame(height: 150)
                                                .foregroundStyle(.secondary)
                                                .opacity(0.3)
                                                .cornerRadius(10)
                                            
                                            Image(systemName: "photo")
                                                .resizable()
                                                .foregroundStyle(.secondary)
                                                .scaledToFit()
                                                .frame(height: 50)
                                        }
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Text(article.title)
                                            .titleFont()
                                        
                                        Spacer()
                                        
                                        Text(article.publishedAt.convertDate())
                                            .descriptionFont()
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .frame(width: 260, height: 260)
                                .padding(10)
                                .background(.white)
                                .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.horizontal)
                }

            }
            .background(.black.opacity(0.2))
            .navigationTitle("News")
        }
    }
    
}

#Preview {
    HomeView()
}
