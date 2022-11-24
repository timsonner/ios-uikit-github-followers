//
//  UserModel.swift
//  Github Followers
//
//  Created by Timothy Sonner on 11/23/22.
//

import Foundation

// https://api.github.com/users/<user>

struct User: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl: String
    var following: Int
    var followers: Int
    var createdAt: String
}
