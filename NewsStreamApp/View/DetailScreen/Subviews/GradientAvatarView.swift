//
//  GradientAvatarView.swift
//  NewsStreamApp
//
//  Created by Кирилл on 16.02.2026.
//

import SwiftUI

struct GradientAvatarView: View {
    
    // MARK: - Body
    var body: some View {
        GeometryReader { _ in
            LinearGradient(
                colors: [Color(UIColor.systemBackground), .clear],
                startPoint: .bottom,
                endPoint: .top
            )
            .frame(height: SizeConstants.avatarHeight / 4)
            .offset(y: -SizeConstants.avatarHeight / 4)
        }
    }
    
}
