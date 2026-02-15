//
//  PlaceholderView.swift
//  NewsStreamApp
//
//  Created by Кирилл on 15.02.2026.
//

import Foundation
import SwiftUI

struct PlaceholderView: View {
    
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: width, height: height)
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
    
}
