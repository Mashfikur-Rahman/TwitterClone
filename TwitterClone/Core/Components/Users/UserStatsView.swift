//
//  UserStatsView.swift
//  TwitterClone
//
//  Created by Mashfikur Rahman on 11/12/23.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack(spacing: 20) {
            HStack(spacing: 5) {
                Text("20M")
                    .font(.subheadline)
                    .bold()
                
                Text("Follower")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            HStack {
                Text("36M")
                    .font(.subheadline)
                    .bold()
                    
                Text("Following")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    UserStatsView()
}
