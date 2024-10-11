//
//  ImgurImage.swift
//  AlbumsApp
//
//  Created by Nikolai Tarasov on 10/9/24.
//

import Foundation

struct ImgurImage: Codable {
    let id: String
    let title: String?
    let description: String?
    let datetime: Int
    let type: String?
    let animated: Bool
    let width: Int
    let height: Int
    let size: Int
    let views: Int
    let bandwidth: Int
    let vote: String?
    let favorite: Bool
    let nsfw: Bool?
    let section: String?
    let accountUrl: String?
    let accountId: Int?
    let isAd: Bool
    let inMostViral: Bool
    let hasSound: Bool
    let tags: [String]
    let adType: Int
    let adUrl: String
    let edited: String
    let inGallery: Bool
    let link: String
    let commentCount: Int?
    let favoriteCount: Int?
    let ups: Int?
    let downs: Int?
    let points: Int?
    let score: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, title, description, datetime, type, animated, width, height, size, views, bandwidth, vote, favorite, nsfw, section, tags, edited, link, ups, downs, points, score
        case accountUrl = "account_url"
        case accountId = "account_id"
        case isAd = "is_ad"
        case inMostViral = "in_most_viral"
        case hasSound = "has_sound"
        case adType = "ad_type"
        case adUrl = "ad_url"
        case inGallery = "in_gallery"
        case commentCount = "comment_count"
        case favoriteCount = "favorite_count"
    }
}
