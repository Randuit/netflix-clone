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
        VStack {
            if viewModel.trendingMovies.isEmpty {
                ProgressView()
                    .controlSize(.regular)
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
            } else {
                NavigationStack {
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
                                        
                                        Card(trendingItemImage: item.poster ??
                                             URL(string: "")!)
                                        
                                    }
                                }
                                .padding(.horizontal)
                            }
                            
                            HStack {
                                Text("Trending Series")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 28, weight: .semibold))
                                    .padding()
                                Spacer()
                            }
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
                }
            }
        }
        .frame(alignment: .top)
        .onAppear {
            viewModel.loadMovieTrending()
            viewModel.loadTVTrending()
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

struct Card: View {
    
    let trendingItemImage: URL
    
    var body: some View {
        ZStack {
            AsyncImage(url: trendingItemImage) { image in
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
