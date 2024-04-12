//
//  HomeView.swift
//  Netflix Clone
//
//  Created by Randuit on 04/04/24.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    // MARK: - Properties
    
    @StateObject var viewModel = HomeViewModel()
    
    // MARK: - View
    
    var body: some View {
        GeometryReader { screenSize in
            VStack {
                switch viewModel.viewState {
                case .idle:
                    Color.clear.onAppear {
                        Task {
                            viewModel.fetch()
                        }
                    }
                case .loading:
                    ProgressView()
                        .controlSize(.regular)
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: .infinity)
                case .success:
                    NavigationStack {
                        ScrollView {
                            VStack {
                                /// generating TopMovie view with the first result in trending movies
                                TopMovie(topMovie: viewModel.trendingMovies.first!, screenSize: screenSize)
                                
                                // Trending movies
                                Header(text: "Trending Movies")
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack {
                                        /// excluding first index because it already appears in TopMovie
                                        ForEach(1 ..< viewModel.trendingMovies.count, id: \.self) { index in
                                            Card(trendingItemImage: viewModel.trendingMovies[index].poster ??
                                                 URL(string: "")!)
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                                
                                // Trending series
                                Header(text: "Trending Series")
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(viewModel.trendingTV) { item in
                                            Card(trendingItemImage: item.poster ??
                                                 URL(string: "")!)
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                                .padding(.bottom)
                            }
                        }
                        .background(Color.black)
                        .edgesIgnoringSafeArea(.top)
                        .refreshable {
                            viewModel.fetch()
                        }
                    }
                case .error(let error):
                    Text(error)
                        .foregroundStyle(Color.white)
                        .font(.system(size: 28))
                }
            }
        }
        .frame(alignment: .top)
    }
}

struct TopMovie: View {
    
    // MARK: - Properties
    
    let topMovie: Movie
    /// to make image fit to screen
    let screenSize: GeometryProxy
    
    // MARK: - View
    
    var body: some View {
        VStack {
            ZStack {
                AsyncImage(url: topMovie.backdropURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: screenSize.size.width, height: 350)
                        .frame(maxWidth: .infinity)
                        .clipped()
                } placeholder: {
                    ProgressView()
                        .frame(height: 350)
                }
                
                Rectangle()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [Color.clear, Color.black]),
                        startPoint: .top,
                        endPoint: .bottom))
                
                VStack(alignment: .leading, spacing: 8) {
                    Spacer()
                    HStack {
                        Text(topMovie.title)
                            .foregroundStyle(Color.white)
                            .font(.system(size: 26, weight: .semibold))
                        Spacer()
                    }
                    HStack {
                        Text("Rating: \(topMovie.vote_average.formatted(.number.precision(.fractionLength(1)))) ⭐️")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 16, weight: .semibold))
                    }
                }
                .padding()
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
                .clipShape(RoundedRectangle(cornerRadius: 15.0))
            }
            .frame(width: 120, height: 50)
            .padding(.top)
        }
    }
}

struct Header: View {
    
    // MARK: - Properties
    
    let text: String
    
    // MARK: - View
    
    var body: some View {
        HStack {
            Text(text)
                .foregroundStyle(.white)
                .font(.system(size: 26, weight: .semibold))
                .padding()
            Spacer()
        }
    }
}

struct Card: View {
    
    // MARK: - Properties
    
    let trendingItemImage: URL
    
    // MARK: - View
    
    var body: some View {
        ZStack {
            AsyncImage(url: trendingItemImage) { image in
                image
                    .resizable()
                    .scaledToFill()
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
