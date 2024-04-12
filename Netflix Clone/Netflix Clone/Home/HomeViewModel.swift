//
//  HomeViewModel.swift
//  Netflix Clone
//
//  Created by Randuit on 08/04/24.
//

import Foundation
import SwiftUI

@MainActor
class HomeViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var trendingMovies: [Movie] = []
    @Published var trendingTV: [TV] = []
    
    static let apiKey = "e5eceee6ecbbf621adb239e3f94bf797"
    
    // MARK: - Public Methods
    
    func loadMovieTrending() {
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/trending/movie/day?api_key=\(HomeViewModel.apiKey)")!
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let trendingResults = try JSONDecoder().decode(MovieTrendingResults.self, from: data)
                trendingMovies = trendingResults.results
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func loadTVTrending() {
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/trending/tv/day?api_key=\(HomeViewModel.apiKey)")!
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let trendingResults = try JSONDecoder().decode(TVTrendingResults.self, from: data)
                trendingTV = trendingResults.results
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
