//
//  AuthViewModel.swift
//  TwitterClone
//
//  Created by Mashfikur Rahman on 11/17/23.
//

import SwiftUI
import FirebaseStorage
import Foundation
import Firebase
import FirebaseCore
import FirebaseCoreExtension
import FirebaseAuthInterop
import FirebaseAuth



class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    private var temUserSession: FirebaseAuth.User?
    @Published var currentUser: User?
    private let service = UserService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
    }
    
    
//    logged in logic
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to sing in with error \(error.localizedDescription)")
                
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
    }
    
    
    
//    register block logic
    func register(withEmail email: String, password: String, username: String, fullname: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with user \(error.localizedDescription)")
                
                return
            }
            
            guard let user = result?.user else { return }
            self.temUserSession = user
            
            let data = [ "email": email,
                         "username": username.lowercased(),
                         "fullname": fullname,
                         "uid": user.uid ]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    self.didAuthenticateUser = true
            }
        }
    }
    
    
    func signOut() {
    //      sets user session to nil so we show login view
        userSession = nil
        
    //      sign user out on server
        try? Auth.auth().signOut()
    }
    
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = temUserSession?.uid else { return }
        
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { _ in
                    self.userSession = self.temUserSession
                    self.fetchUser()
            }
        }
    }
    
    
    func fetchUser() {
        guard let uid = self.userSession?.uid else { return }
        
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
    }
}

