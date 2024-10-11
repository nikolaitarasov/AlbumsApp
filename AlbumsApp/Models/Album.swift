//
//  Album.swift
//  AlbumsApp
//
//  Created by Nikolai Tarasov on 10/9/24.
//

import SwiftUI

struct Album: Identifiable {
    let id: String
    let title: String?
    var coverImageURL: String
    let imagesLinks: [String]
    let isFavorite: Bool
}
