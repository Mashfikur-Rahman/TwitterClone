//
//  ProfilePhotoSelectorView.swift
//  TwitterClone
//
//  Created by Mashfikur Rahman on 11/18/23.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Setup your account.", 
                           title2: "Add your profile photo.")
            
            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .frame(width: 110, height: 110)
                        .scaledToFill()
                        .clipShape(Circle())
                } else {
                    Image(systemName: "photo.circle")
                        .resizable()
                        .frame(width: 110, height: 110)
                        .scaledToFill()
                        .clipShape(Circle())
                    
                }
            }
            .padding(.top, 60)
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            .padding(.bottom, 50)
            
            if let selectedImage = selectedImage {
                Button {
                    viewModel.uploadProfileImage(selectedImage)
                } label: {
                    Text("Continue")
                        .font(.title3)
                        .frame(width: 350, height: 50)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
                .shadow(color: .gray.opacity(0.9), radius: 10, x: 0, y: 0)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}


//private struct ProfileImageModifier: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//    }
//}

#Preview {
    ProfilePhotoSelectorView()
}
