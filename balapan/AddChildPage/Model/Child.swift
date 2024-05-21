//
//  Child.swift
//  balapan
//
//  Created by Nurbol on 20.05.2024.
//

import Foundation

struct UpdateUserFilterRequest: Codable {
    let categories: [String]
    let types: [String]
    let gender: String
    let age: Int
}

struct UpdateUserFilterResponse: Codable {
    let message: String
}

struct FilterErrorResponse: Codable, Error {
    let error: String
}
