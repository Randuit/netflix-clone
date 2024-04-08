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
    
    @Published var trendingMovies: [Movie] = []
    static let apiKey = "e5eceee6ecbbf621adb239e3f94bf797"
    
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
}
