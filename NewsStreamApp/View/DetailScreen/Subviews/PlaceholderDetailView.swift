//
//  PlaceholderDetailView.swift
//  NewsStreamApp
//
//  Created by Кирилл on 16.02.2026.
//

import SwiftUI

struct PlaceholderDetailView: View {
    
    // MARK: - Properties
    let width: CGFloat
    let height: CGFloat
    let reader: GeometryProxy
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.secondary)
                .opacity(0.3)            
            
            Image(systemName: "photo")
                .resizable()
                .foregroundStyle(.secondary)
                .scaledToFit()
                .frame(height: 50)
        }
        .offset(y: -reader.frame(in: .global).minY)
        .frame(
            width: width,
            height: reader
                .frame(
                    in: .global
                ).minY + height + 10)
    }
    
}
