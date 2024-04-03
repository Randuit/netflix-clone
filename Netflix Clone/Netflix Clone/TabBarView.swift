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
            Text("Home")
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            Text("Search")
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
        .tint(Color(red: 255, green: 255, blue: 255))
        .onAppear(perform: {
            UITabBar.appearance().unselectedItemTintColor = UIColor(red: 140/255, green: 135/255, blue: 135/255, alpha: 1)
            UITabBar.appearance().backgroundColor = UIColor(red: 18/255, green: 18/255, blue: 18/255, alpha: 1)
        })
    }
}

#Preview {
    TabBarView()
}