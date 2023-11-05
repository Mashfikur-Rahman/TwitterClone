//
//  TweetRowView.swift
//  TwitterClone
//
//  Created by Mashfikur Rahman on 11/5/23.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
//         Profile image + user info + tweets
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.blue)
                
                
//              User info & tweets camption
                VStack(alignment: .leading, spacing: 5) {
//                    User info
                    HStack{
                        Text("Bat Man")
                            .font(.subheadline).bold()
                        
                        Text("@batman")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
//                 tweets caption
                    Text("I believe in Allah!")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            
//          action button
            HStack{
                Button{
//                    action goes to here
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()
                
                    Button{
    //                    action goes to here
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                            .font(.subheadline)
                    }
                
                Spacer()
                
                    Button{
    //                    action goes to here
                    } label: {
                        Image(systemName: "heart")
                            .font(.subheadline)
                    }
                
                Spacer()
                
                    Button{
    //                    action goes to here
                    } label: {
                        Image(systemName: "bookmark")
                            .font(.subheadline)
                    }
            }
            .padding()
        }
        .padding(.horizontal)
        Divider()
    }
}




#Preview {
    TweetRowView()
}
