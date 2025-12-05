//
//  Untitled.swift
//  Emotiva
//
//  Created by Jonas Fernando Nascimento Melo on 05/12/25.
//
import SwiftUI
import Foundation

struct ColoredBackground<Content: View>: View {
    @ObservedObject var viewModel = CoreDataViewModel()
    var sentimentScore: Double
    let content: Content
    
    init(score: Double, @ViewBuilder content: () -> Content) {
        self.sentimentScore = score
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [viewModel.getColor(for: sentimentScore).opacity(0.3),Color(.systemBackground)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            .animation(.easeInOut(duration: 1.0), value: sentimentScore)
            
            content
        }
    }
}
