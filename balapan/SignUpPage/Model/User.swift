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
struct SignUpResponse: Codable {
    let access_token: String?

}
