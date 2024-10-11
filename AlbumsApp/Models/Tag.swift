//
//  Tag.swift
//  AlbumsApp
//
//  Created by Nikolai Tarasov on 10/9/24.
//

import Foundation

struct Tag: Codable {
    let name: String
    let displayName: String
    let followers: Int
    let totalItems: Int
    let following: Bool
    let isWhitelisted: Bool
    let backgroundHash: String
    let thumbnailHash: String?
    let accent: String?
    let backgroundIsAnimated: Bool
    let thumbnailIsAnimated: Bool
    let isPromoted: Bool
    let description: String
    let logoHash: String?
    let logoDestinationUrl: String?
    let descriptionAnnotations: [String: String]
    
    enum CodingKeys: String, CodingKey {
        case name, followers, following, accent, description
        case displayName = "display_name"
        case totalItems = "total_items"
        case isWhitelisted = "is_whitelisted"
        case backgroundHash = "background_hash"
        case thumbnailHash = "thumbnail_hash"
        case backgroundIsAnimated = "background_is_animated"
        case thumbnailIsAnimated = "thumbnail_is_animated"
        case isPromoted = "is_promoted"
        case logoHash = "logo_hash"
        case logoDestinationUrl = "logo_destination_url"
        case descriptionAnnotations = "description_annotations"
    }
}
