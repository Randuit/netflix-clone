//
//  TabBarView.swift
//  Netflix Clone
//
//  Created by Randuit on 03/04/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            Text("Search")
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
        .tint(Color(.white))
        .onAppear(perform: {
            
            // TabBar colors
            let appearance = UITabBarAppearance()
            appearance.backgroundColor = .dark
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
            UITabBar.appearance().unselectedItemTintColor = .unselectedGrey
        })
    }
}

#Preview {
    TabBarView()
}
