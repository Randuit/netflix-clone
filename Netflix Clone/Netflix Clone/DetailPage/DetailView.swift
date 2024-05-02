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
                        
                        VStack(alignment: .leading, spacing: 5) {
                            HStack {
                                Text(movie.title)
                                    .foregroundStyle(Color.white)
                                    .font(.system(size: 22, weight: .bold))
                                Spacer()
                            }
                            
                            HStack(spacing: 16) {
                                Text("Score: \(movie.vote_average.formatted(.number.precision(.fractionLength(1))))")
                                    .foregroundStyle(movie.vote_average < 6 ?
                                                     Color.red : movie.vote_average < 8 ?
                                                     Color.yellow : Color.green)
                                    .opacity(0.7)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text(movie.release_date.prefix(4))
                                    .foregroundStyle(.white.opacity(0.7))
                                    .font(.system(size: 16, weight: .medium))
                                
                                Spacer()
                            }
                            
                            Text(movie.overview)
                                .foregroundStyle(.white)
                                .font(.system(size: 14, weight: .regular))
                                .padding(.top)
                        }
                        .padding(.horizontal)
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
                        
                        VStack(alignment: .leading, spacing: 5) {
                            HStack {
                                Text(tv.name)
                                    .foregroundStyle(Color.white)
                                    .font(.system(size: 22, weight: .bold))
                                Spacer()
                            }
                            
                            HStack(spacing: 16) {
                                Text("Score: \(tv.vote_average.formatted(.number.precision(.fractionLength(1))))")
                                    .foregroundStyle(tv.vote_average < 6 ?
                                                     Color.red : tv.vote_average < 8 ?
                                                     Color.yellow : Color.green)
                                    .opacity(0.7)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text(tv.first_air_date.prefix(4))
                                    .foregroundStyle(.white.opacity(0.7))
                                    .font(.system(size: 16, weight: .medium))
                            }
                            
                            Text(tv.overview)
                                .foregroundStyle(.white)
                                .font(.system(size: 14, weight: .regular))
                                .padding(.top)
                        }
                        .padding(.horizontal)
                        
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
