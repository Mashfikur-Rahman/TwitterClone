//
//  LoginView.swift
//  TwitterClone
//
//  Created by Mashfikur Rahman on 11/16/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
//        Parent view
        VStack {
            
//            Header VIew
            AuthHeaderView(title1: "Hello There", title2: "Welcome Back!")
            
            VStack(spacing: 40) {
                CustomerInputField(imageName: "envelope.fill",
                                   placeholderText: "Email",
                                   text: $email)
                
                CustomerInputField(imageName: "lock",
                                   placeholderText: "Password",
                                   isSecureField: true,
                                   text: $password)
            }
            .padding(.horizontal, 33)
            .padding(.top, 44)
            
            
            HStack {
                Spacer()
                
                NavigationLink {
                    Text("reset password button press")
                } label: {
                    Text("Forgot Password?")
                        .font(.title3)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.top)
                        .padding(.trailing, 24)
                }
            }
            
            
            Button {
                viewModel.login(withEmail: email, password: password)
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
            
            
            NavigationLink {
                RegistrationView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                HStack {
                    Text("Don't have an account?")
                    
                    Text("Sign up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 35)
            .foregroundColor(Color(.systemBlue))
            
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LoginView()
}
