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

    private let topPlaceholder: AnyView = AnyView(PlaceholderView(width: 260, height: 150))
    private let bottomPlaceholder: AnyView = AnyView(PlaceholderView(width: 120, height: 120))

    // MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                // MARK: - Top news
                sectionHeader("Top News")

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        if vm.topNews.isEmpty {
                            emptyDataView()
                        } else {
                            ForEach(vm.topNews, id: \.url) { article in
                                ArticleView(
                                    article: article,
                                    placeholder: topPlaceholder,
                                    imageWidth: 260,
                                    imageHeight: 150,
                                    width: 260,
                                    height: 260
                                )
                            }
                        }
                    }
                    .padding(.horizontal)
                }

                // MARK: - Bottom news
                sectionHeader("Bottom news")

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        if vm.topNews.isEmpty {
                            emptyDataView()
                        } else {
                            ForEach(vm.topNews, id: \.url) { article in
                                ArticleView(
                                    article: article,
                                    placeholder: bottomPlaceholder,
                                    imageWidth: 120,
                                    imageHeight: 120,
                                    width: 120,
                                    height: 240
                                )
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .background(Color.black.opacity(0.2))
            .navigationTitle("News")
        }
    }

    // MARK: - Small helpers
    private func sectionHeader(_ title: String) -> some View {
        Text(title)
            .font(.title)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
            .padding(.top)
    }

    private func emptyDataView() -> some View {
        Text("Нет данных")
            .foregroundStyle(.secondary)
            .padding()
    }
}

#Preview {
    HomeView()
}
