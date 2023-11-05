//
//  TwitterCloneApp.swift
//  TwitterClone
//
//  Created by Mashfikur Rahman on 11/5/23.
//

import SwiftUI

import Firebase
import FirebaseStorage

@main
struct TwitterCloneApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(viewModel)
        }
    }
}
