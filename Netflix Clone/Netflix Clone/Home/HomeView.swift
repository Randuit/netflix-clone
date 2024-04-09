//
//  HomeView.swift
//  Netflix Clone
//
//  Created by Randuit on 04/04/24.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        Group {
            if viewModel.trendingMovies.isEmpty {
                ProgressView()
                    .controlSize(.regular)
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
            } else {
                ScrollView {
                    VStack {
                        TopMovie()
                        
                        HStack {
                            Text("Trending Movies")
                                .foregroundStyle(.white)
                                .font(.system(size: 28, weight: .semibold))
                                .padding()
                            Spacer()
                        }
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(viewModel.trendingMovies) { item in
                                    MovieCard(trendingItem: item)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.top)
        .frame(alignment: .top)
        .onAppear {
            viewModel.loadMovieTrending()
        }
    }
}

struct TopMovie: View {
    var body: some View {
        VStack {
            ZStack {
                Color.red
            }
            Button {
                
            } label: {
                HStack {
                    Image(systemName: "info.circle")
                    Text("Info")
                }
                .foregroundStyle(.white)
                .font(.system(size: 16, weight: .semibold))
                .frame(maxWidth: 120, maxHeight: 50)
                .background(Color(uiColor: .dark))
                .cornerRadius(15)
            }
            .padding(.top)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 460)
    }
}

struct MovieCard: View {
    
    let trendingItem: Movie
    
    var body: some View {
        ZStack {
            AsyncImage(url: trendingItem.poster) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 102, height: 161)
                    .clipped()
            } placeholder: {
                ProgressView()
            }
        }
        .frame(width: 102, height: 161)
    }
}

#Preview {
    HomeView()
}
