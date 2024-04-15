//
//  TrendingResults.swift
//  Netflix Clone
//
//  Created by Randuit on 08/04/24.
//

import Foundation

struct MovieTrendingResults: Decodable {
    let page: Int
    let results: [Movie]
    let total_pages: Int
    let total_results: Int
}

struct Movie: Identifiable, Decodable {
    let adult: Bool
    let id: Int
    let poster_path: String?
    let title: String
    let overview: String
    let vote_average: Float
    let backdrop_path: String?

    var backdropURL: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/original")
        return baseURL?.appending(path: backdrop_path ?? "")
    }

    var poster: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/original")
        return baseURL?.appending(path: poster_path ?? "")
    }
}
