//
//  User.swift
//  balapan
//
//  Created by Nurbol on 18.05.2024.
//

import Foundation

struct User: Codable {
    var email: String
    var password: String

    init(email: String) {
        self.email = email
        self.password = ""
    }

    mutating func setPassword(password: String) {
        self.password = password
    }
}

struct SignUpRequest {
    let email: String
    let password: String
}

struct SignUpResponse: Codable {
    let token: String
}

enum SignUpErrorResponse: Error {
    case invalidResponse
    case serverError(String)
}
