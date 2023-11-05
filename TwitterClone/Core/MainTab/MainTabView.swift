//
//  MainTabView.swift
//  TwitterClone
//
//  Created by Mashfikur Rahman on 11/5/23.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        TabView(selection: $selectedIndex){
            FeedView()
                .onTapGesture {
                    self.selectedIndex = 0
            }
            .tabItem {
                  Image(systemName: "house")
            }.tag(0)
            
            FeedView()
                .onTapGesture {
                    self.selectedIndex = 1
            }
            .tabItem {
                  Image(systemName: "magnifyingglass")
            }.tag(1)
            
            FeedView()
                .onTapGesture {
                    self.selectedIndex = 2
            }
            .tabItem {
                  Image(systemName: "bell")
            }.tag(2)
            
            FeedView()
                .onTapGesture {
                    self.selectedIndex = 3
            }
            .tabItem {
                  Image(systemName: "envelope")
            }.tag(3)
        }
    }
}



#Preview {
    MainTabView()
}
