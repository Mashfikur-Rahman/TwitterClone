//
//  User.swift
//  TwitterClone
//
//  Created by Mashfikur Rahman on 11/18/23.
//

import Foundation
import FirebaseFirestoreSwift


struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
}
