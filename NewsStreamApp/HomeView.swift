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
                                    ZStack {
                                        Rectangle()
                                            .frame(height: 150)
                                            .foregroundStyle(.black.opacity(0.5))
                                    }
                                }
                                .frame(width: 260, height: 260)
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
