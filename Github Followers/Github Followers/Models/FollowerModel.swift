//
//  FollowerModel.swift
//  Github Followers
//
//  Created by Timothy Sonner on 11/23/22.
//

import Foundation

// https://api.github.com/<user>/followers

struct FollowerModel: Codable {
    
    var login: String // username
    var avatarUrl: String
}
