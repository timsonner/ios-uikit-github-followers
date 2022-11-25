//
//  ErrorMessageEnum.swift
//  Github Followers
//
//  Created by Timothy Sonner on 11/23/22.
//

import Foundation

enum ErrorMessage: String, Error {
    case invalidUsername = "Invalid Username"
    case unableToComplete = "Unable to complete network request. No Internet."
    case invalidResponse = "Server response error. Try again."
    case invalidData = "Server data unusable. Try again."
}
