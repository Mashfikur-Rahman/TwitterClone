//
//  ExploreView.swift
//  TwitterClone
//
//  Created by Mashfikur Rahman on 11/5/23.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        
        NavigationView {
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach (0 ... 20, id: \.self) { _ in
                            NavigationLink {
//                                ProfileView(user: user)
                            } label: {
                                UserRowView()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ExploreView()
}
