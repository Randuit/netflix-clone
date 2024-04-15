//
//  DetailView.swift
//  Netflix Clone
//
//  Created by Randuit on 15/04/24.
//

import Foundation
import SwiftUI

struct DetailView: View {
    
    // MARK: - Properties
    
    @Environment(\.dismiss) var dismiss
    var selectedMovie: Movie
    
    // MARK: - View
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    ZStack {
                        AsyncImage(url: selectedMovie.backdropURL) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: geo.size.width, height: 300)
                                .frame(maxWidth: .infinity)
                                .clipped()
                        } placeholder: {
                            ProgressView()
                                .frame(height: 300)
                                .frame(maxWidth: .infinity)
                        }
                        
                        Rectangle()
                            .fill(LinearGradient(
                                gradient: Gradient(colors: [Color.clear, Color.black]),
                                startPoint: .top,
                                endPoint: .bottom))
                    }
                    
                    HStack {
                        Text(selectedMovie.title)
                            .foregroundStyle(Color.white)
                            .font(.system(size: 18, weight: .semibold))
                            .padding(.leading, 7)
                        Spacer()
                    }
                    
                }
                .frame(maxWidth: .infinity)
            }
            .background(Color.black)
        }
    }
}

#Preview {
    HomeView()
}
