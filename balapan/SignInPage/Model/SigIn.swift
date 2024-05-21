//
//  SigIn.swift
//  balapan
//
//  Created by Nurbol on 21.05.2024.
//

import Foundation

struct LoginRequest {
    let email: String
    let password: String
}

struct LoginResponse: Codable {
    let token: String
}

enum LoginErrorResponse: Error {
    case invalidResponse
    case serverError(String)
}
