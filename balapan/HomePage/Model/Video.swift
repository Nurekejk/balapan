//
//  Video.swift
//  balapan
//
//  Created by Nurbol on 19.05.2024.
//

import Foundation

struct Playlist: Decodable {
    let id: String
    let name: String
    let videos: [Video]
    let version: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case videos
        case version = "__v"
    }
}

struct Video: Decodable {
    let id: String
    let category: String
    let thumbnail: String
    let version: Int
    let title: String
    let description: String
    let shortDescription: String
    let type: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case category
        case thumbnail
        case version = "__v"
        case title
        case description
        case shortDescription
        case type
        case url
    }
}

struct ErrorResponse: Decodable, Error {
    let message: String
}
