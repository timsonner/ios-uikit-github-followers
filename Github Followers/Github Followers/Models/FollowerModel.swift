//
//  FollowerModel.swift
//  Github Followers
//
//  Created by Timothy Sonner on 11/23/22.
//

import Foundation

// https://api.github.com/<user>/followers

struct Followers: Codable {
    
    var login: String
    var avatarUrl: String
}
