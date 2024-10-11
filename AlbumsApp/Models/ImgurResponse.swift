//
//  ImgurResponse.swift
//  AlbumsApp
//
//  Created by Nikolai Tarasov on 10/9/24.
//

import Foundation

// Generic wrapper for the API response
struct APIResponse<T: Codable>: Codable {
    let data: T
    let success: Bool
    let status: Int
}

// Generic wrapper for collections
struct CollectionResponse<T: Codable>: Codable {
    let data: [T]
    let success: Bool
    let status: Int
}
