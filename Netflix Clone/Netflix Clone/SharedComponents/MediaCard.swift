//
//  MediaCard.swift
//  Netflix Clone
//
//  Created by Randuit on 15/04/24.
//

import Foundation
import SwiftUI

struct MediaCard: View {
    
    // MARK: - Properties
    
    @State private var showingSheet = false
    let media: MediaType
    
    // MARK: - View
    
    var body: some View {
        ZStack {
            switch media {
            case .movie(let movie):
                AsyncImage(url: movie.poster) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 105, height: 161)
                        .clipped()
                } placeholder: {
                    ProgressView()
                }
            case .tvSerie(let tv):
                    AsyncImage(url: tv.poster) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 105, height: 161)
                            .clipped()
                    } placeholder: {
                        ProgressView()
                    }
            }
        }
        .frame(width: 105, height: 161)
        .clipShape(RoundedRectangle(cornerRadius: 5.0))
        .onTapGesture {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            switch media {
            case .movie(let movie):
                DetailView(selectedMedia: .movie(movie))
            case .tvSerie(let tv):
                DetailView(selectedMedia: .tvSerie(tv))
            }
        }
    }
}
