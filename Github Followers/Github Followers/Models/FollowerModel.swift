//
//  FollowerModel.swift
//  Github Followers
//
//  Created by Timothy Sonner on 11/23/22.
//

import Foundation

// https://api.github.com/<user>/followers

struct FollowerModel: Codable, Hashable {
    
    var login: String // username
    var avatarUrl: String
    
    // Example hash function.
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(login)
//    }
}
