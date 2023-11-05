//
//  ProfileView.swift
//  TwitterClone
//
//  Created by Mashfikur Rahman on 11/6/23.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @State private var selectedFilter: TweetFilterViewModel = .tweets
    @Namespace var animation
    @Environment(\.presentationMode) var mode
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        VStack(alignment: .leading) {
//          Header view
            headerView
                
//          Actions buttons
            actionButtons
            
//          user info details
            userInfoDetails
            
//          Tweet Filer Bar ( tweet, Relies, Likes)
            tweetFilterBar
            
//          tweet view
            tweetView
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}



#Preview {
    ProfileView(user: User(id: NSUUID().uuidString,
                           username: "mashfik",
                           fullname: "Mashfikur rahman",
                           profileImageUrl: "", 
                           email: "mash@gmail.com"))
}



//profile view logic block
extension ProfileView {
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack{
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 16, y: -6)
                }
                
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 70, height: 70)
                    .offset(x: 16, y: 29)
            }
        }
        .frame(height: 96)
    }
    
    
    
//    action button block logic
    var actionButtons: some View {
        HStack(spacing: 12){
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding()
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.70))
            
            Button {
                
            } label: {
                Text("Edit Button")
                    .font(.subheadline)
                    .frame(width: 120, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.70))
            }
        }
        .padding(.trailing)
    }
    
    
    
//   user info details block
    var userInfoDetails: some View {
        VStack(alignment: .leading, spacing: 3){
            HStack {
//            Profile name
                Text(user.fullname)
                
//            profile badge icon
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            
//          user name
            Text("@\(user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
//          profile caption
            Text("Your mother favorite villan")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 30){
                HStack{
//          location icon image
                    Image(systemName: "mappin.and.ellipse")
                    
//          location name
                    Text("New York")
                }
                
                HStack{
        //    email link icon image
                    Image(systemName: "link")
                    
        //    email link
                    Text("www.thejoker.com")
                }
        }
        .font(.caption)
        .foregroundColor(.gray)
            
            
//        follwer & following logic block
            UserStatsView()
                .padding(.vertical)
        }
        .padding(.horizontal)
    }
    
    
    
//  Tweet filter bar block
    var tweetFilterBar: some View {
        HStack{
            ForEach (TweetFilterViewModel.allCases, id: \.rawValue) { item in
                VStack{
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    
                    if selectedFilter == item {
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedFilter = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x: 0, y: 15))
    }
    
    
// tweet view block
    
    var tweetView: some View {
        ScrollView {
            LazyVStack {
                ForEach(0 ... 9, id: \.self) { _ in
                    TweetRowView()
                }
            }
        }
    }
}
