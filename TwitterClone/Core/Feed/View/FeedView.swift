//
//  FeedView.swift
//  TwitterClone
//
//  Created by Mashfikur Rahman on 11/5/23.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    ForEach(0 ... 20, id: \.self){ _ in
                        TweetRowView()
                            
                    }
                }
            }
            
            Button {
                showNewTweetView.toggle()
            } label: {
                Image("tweets")
                    .resizable()
                    .frame(width: 55, height: 55)
                    .padding()
            }
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewTweetView) {
                NewTweetView()
            }
        }
    }
}

#Preview {
    FeedView()
}
