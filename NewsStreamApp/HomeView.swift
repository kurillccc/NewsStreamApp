//
//  ContentView.swift
//  NewsStreamApp
//
//  Created by Кирилл on 13.02.2026.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Properties
    @StateObject var vm = ViewModel()
    
    // MARK: - Body
    var body: some View {
        VStack {
            ForEach(vm.topNews, id: \.url) { article in
                Text(article.description ?? "")
            }
        }
    }
    
}

#Preview {
    HomeView()
}
