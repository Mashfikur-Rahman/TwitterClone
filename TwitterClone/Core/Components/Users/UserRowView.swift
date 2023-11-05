//
//  SwiftUIView.swift
//  TwitterClone
//
//  Created by Mashfikur Rahman on 11/11/23.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Joker")
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                
                Text("Heath Ledger")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}



#Preview {
    UserRowView()
}
