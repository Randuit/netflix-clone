//
//  HomeView.swift
//  Netflix Clone
//
//  Created by Randuit on 04/04/24.
//

import Foundation
import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack {
                TopMovie()
                
                HStack {
                    Text("Trending")
                        .foregroundStyle(.white)
                        .font(.system(size: 28, weight: .semibold))
                        .padding()
                    Spacer()
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<10, id: \.self) { _ in
                            MovieCard()
                                .frame(width: 102, height: 161)
                        }
                    }
                    .padding(.horizontal)
                }
                
                HStack {
                    Text("Action Movies")
                        .foregroundStyle(.white)
                        .font(.system(size: 28, weight: .semibold))
                        .padding()
                    Spacer()
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<10, id: \.self) { _ in
                            MovieCard()
                                .frame(width: 102, height: 161)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom)
            }
        }
        .edgesIgnoringSafeArea(.top)
        .frame(alignment: .top)
        .background(Color.black)
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
                .background(Color(red: 18/255, green: 18/255, blue: 18/255))
                .cornerRadius(15)
            }
            .padding(.top)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 460)
    }
}

struct MovieCard: View {
    var body: some View {
        ZStack {
            Color.orange
        }
    }
}

#Preview {
    HomeView()
}
