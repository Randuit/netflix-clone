//
//  TVTrendingResults.swift
//  Netflix Clone
//
//  Created by Randuit on 11/04/24.
//

import Foundation

struct TVTrendingResults: Decodable {
    let page: Int
    let results: [TV]
    let total_pages: Int
    let total_results: Int
}

struct TV: Identifiable, Decodable {
    let adult: Bool
    let id: Int
    let poster_path: String?
    let name: String
    let overview: String
    let vote_average: Float
    let backdrop_path: String?

    var backdropURL: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w500")
        return baseURL?.appending(path: backdrop_path ?? "")
    }

    var poster: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w500")
        return baseURL?.appending(path: poster_path ?? "")
    }
}
