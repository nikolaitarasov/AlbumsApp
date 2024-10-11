//
//  AdConfig.swift
//  AlbumsApp
//
//  Created by Nikolai Tarasov on 10/11/24.
//

import Foundation

struct AdConfig: Codable {
    let safeFlags: [String]
    let highRiskFlags: [String]
    let unsafeFlags: [String]
    let wallUnsafeFlags: [String]
    let showsAds: Bool
    let showAdLevel: Int
    let nsfw_score: Double
    
    enum CodingKeys: String, CodingKey {
        case safeFlags = "safeFlags"
        case highRiskFlags = "highRiskFlags"
        case unsafeFlags = "unsafeFlags"
        case wallUnsafeFlags = "wallUnsafeFlags"
        case showsAds = "showsAds"
        case showAdLevel = "showAdLevel"
        case nsfw_score = "nsfw_score"
    }
}
