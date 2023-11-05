//
//  RegistrationView.swift
//  TwitterClone
//
//  Created by Mashfikur Rahman on 11/16/23.
//

import SwiftUI


struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    var body: some View {
        VStack {
            
            NavigationLink(destination: ProfilePhotoSelectorView(),
                           isActive: $viewModel.didAuthenticateUser,
                           label: { } )
            
            
            AuthHeaderView(title1: "Get Started :)", title2: "Creat you acount")
            
            VStack(spacing: 40) {
                CustomerInputField(imageName: "envelope.fill",
                                   placeholderText: "Email",
                                   text: $email)
                
                CustomerInputField(imageName: "person", 
                                   placeholderText: "User name",
                                   text: $username)
                
                CustomerInputField(imageName: "person", 
                                   placeholderText: "Full name",
                                   text: $fullname)
                
                CustomerInputField(imageName: "lock",
                                   placeholderText: "Password",
                                   isSecureField: true,
                                   text: $password)
                
            }
            .padding(32)
            
            
            Button {
                viewModel.register(withEmail: email,
                                   password: password,
                                   username: username,
                                   fullname: fullname)
            } label: {
                Text("Sign in")
                    .font(.title3)
                    .frame(width: 350, height: 50)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            }
            .shadow(color: .gray.opacity(0.9), radius: 10, x: 0, y: 0)
            
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Text("Already have an account?")
                    
                    Text("Sign in")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                .padding(.bottom, 35)
            }
        }
        .ignoresSafeArea()
    }
}



#Preview {
    RegistrationView()
}
