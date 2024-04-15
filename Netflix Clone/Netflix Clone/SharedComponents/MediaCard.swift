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
        switch media {
        case .movie(let movie):
            ZStack {
                AsyncImage(url: movie.poster) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 105, height: 161)
                        .clipped()
                } placeholder: {
                    ProgressView()
                }
            }
            .frame(width: 105, height: 161)
            .clipShape(RoundedRectangle(cornerRadius: 5.0))
            .onTapGesture {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                DetailView(selectedMedia: .movie(movie))
                    .presentationDetents([.fraction(0.999)])
            }
        case .tvSerie(let tv):
            ZStack {
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
            .frame(width: 105, height: 161)
            .clipShape(RoundedRectangle(cornerRadius: 5.0))
            .onTapGesture {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                DetailView(selectedMedia: .tvSerie(tv))
                    .presentationDetents([.fraction(0.999)])
            }
        }
    }
}
