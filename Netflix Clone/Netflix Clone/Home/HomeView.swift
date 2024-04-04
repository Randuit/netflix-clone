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
                Text("Ciao")
                    .font(.system(size: 50))
                Text("Ciao")
                    .font(.system(size: 50))
                Text("Ciao")
                    .font(.system(size: 50))
            }
        }
        .frame(maxWidth: .infinity)
        .foregroundStyle(Color.white)
        .background(Color.black)
    }
}

#Preview {
    HomeView()
}
