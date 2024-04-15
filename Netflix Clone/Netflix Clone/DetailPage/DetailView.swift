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
    var selectedMedia: MediaType
    
    // MARK: - View
    
    var body: some View {
        switch selectedMedia {
        case .movie(let movie):
            GeometryReader { geo in
                ScrollView {
                    VStack {
                        ZStack {
                            AsyncImage(url: movie.backdropURL) { image in
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
                            Text(movie.title)
                                .foregroundStyle(Color.white)
                                .font(.system(size: 22, weight: .bold))
                                .padding(.horizontal)
                            Spacer()
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                }
                .background(Color.black)
            }
        case .tvSerie(let tv):
            GeometryReader { geo in
                ScrollView {
                    VStack {
                        ZStack {
                            AsyncImage(url: tv.backdropURL) { image in
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
                            Text(tv.name)
                                .foregroundStyle(Color.white)
                                .font(.system(size: 22, weight: .bold))
                                .padding(.horizontal)
                            Spacer()
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                }
                .background(Color.black)
            }
        }
    }
}

#Preview {
    HomeView()
}
