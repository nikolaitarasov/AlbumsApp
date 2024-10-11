//
//  ImgurAlbum.swift
//  AlbumsApp
//
//  Created by Nikolai Tarasov on 10/11/24.
//

import Foundation

struct ImgurAlbum: Codable {
    let id: String
    let title: String?
    let description: String?
    let datetime: Int
    let cover: String
    let coverWidth: Int
    let coverHeight: Int
    let accountUrl: String
    let accountId: Int
    let privacy: String
    let layout: String
    let views: Int
    let link: String
    let ups: Int
    let downs: Int
    let points: Int
    let score: Int
    let isAlbum: Bool
    let vote: String?
    let favorite: Bool
    let nsfw: Bool
    let section: String
    let commentCount: Int
    let favoriteCount: Int
    let topic: String?
    let topicId: Int?
    let imagesCount: Int
    let inGallery: Bool
    let isAd: Bool
    let tags: [Tag]
    let adType: Int
    let adUrl: String
    let inMostViral: Bool
    let includeAlbumAds: Bool
    let images: [ImgurImage]
    let adConfig: AdConfig
    
    enum CodingKeys: String, CodingKey {
        case id, title, description, datetime, cover, privacy, layout, views, link, ups, downs, points, score, vote, favorite, nsfw, section, topic, tags, images
        case coverWidth = "cover_width"
        case coverHeight = "cover_height"
        case accountUrl = "account_url"
        case accountId = "account_id"
        case isAlbum = "is_album"
        case commentCount = "comment_count"
        case favoriteCount = "favorite_count"
        case topicId = "topic_id"
        case imagesCount = "images_count"
        case inGallery = "in_gallery"
        case isAd = "is_ad"
        case adType = "ad_type"
        case adUrl = "ad_url"
        case inMostViral = "in_most_viral"
        case includeAlbumAds = "include_album_ads"
        case adConfig = "ad_config"
    }
}
