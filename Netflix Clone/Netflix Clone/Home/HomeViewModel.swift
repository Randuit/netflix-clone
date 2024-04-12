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
    
    @Published var viewState: ViewState = .idle
    @Published var trendingMovies: [Movie] = []
    @Published var trendingTV: [TV] = []
    
    static let apiKey = "e5eceee6ecbbf621adb239e3f94bf797"
    
    // MARK: - Public Methods
    
    func fetch() {
        viewState = .loading
        /// DispatchGroup to synchronize calls
        let apiGroup = DispatchGroup()
        
        apiGroup.enter()
        loadMovieTrending {
            apiGroup.leave()
        }
        
        apiGroup.enter()
        loadTVTrending {
            apiGroup.leave()
        }
        
        apiGroup.notify(queue: .main) {
            self.viewState = .success
        }
        
    }
    
    func loadMovieTrending(completion: @escaping () -> Void) {
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/trending/movie/day?api_key=\(HomeViewModel.apiKey)")!
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let trendingResults = try JSONDecoder().decode(MovieTrendingResults.self, from: data)
                trendingMovies = trendingResults.results
                completion()
            } catch {
                print(error.localizedDescription)
                viewState = .error(error.localizedDescription)
            }
        }
    }
    
    func loadTVTrending(completion: @escaping () -> Void) {
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/trending/tv/day?api_key=\(HomeViewModel.apiKey)")!
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let trendingResults = try JSONDecoder().decode(TVTrendingResults.self, from: data)
                trendingTV = trendingResults.results
                completion()
            } catch {
                print(error.localizedDescription)
                viewState = .error(error.localizedDescription)
            }
        }
    }
}
