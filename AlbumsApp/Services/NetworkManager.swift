//
//  NetworkManager.swift
//  AlbumsApp
//
//  Created by Nikolai Tarasov on 10/9/24.
//

import Foundation
import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://api.imgur.com/3"
    private let clientID = "2d086962f60c89e"
    
    private init() {}
    
    func fetchAlbums(query: String) async throws -> [Album] {
        // fetch albums
        let searchUrlString = "\(baseURL)/gallery/search?q_all=\(query)&q_type=album"
        var request = URLRequest(url: URL(string: searchUrlString)!)
        request.addValue("Client-ID \(clientID)", forHTTPHeaderField: "Authorization")
        let (albumsData, _) = try await URLSession.shared.data(for: request)

        var albums: [Album] = []
        let albumsJson = try decodeImgurJSON(jsonData: albumsData)
        
        for album in albumsJson {
            // fetch album cover image
            let searchUrlString = "\(baseURL)/album/\(album.id)/image/\(album.cover)"
            var request = URLRequest(url: URL(string: searchUrlString)!)
            request.addValue("Client-ID \(clientID)", forHTTPHeaderField: "Authorization")
            let (albumCoverData, _) = try await URLSession.shared.data(for: request)

            if let image = decodeImgurImageJSON(jsonData: albumCoverData) {
                let album = Album(id: album.id,
                                  title: album.title,
                                  coverImageURL: image.link,
                                  imagesLinks: album.images.map({ $0.link }),
                                  isFavorite: album.favorite)
                albums.append(album)
            }
        }
        return albums
    }
    
    func decodeImgurJSON(jsonData: Data) throws -> [ImgurAlbum] {
        let decoder = JSONDecoder()
        do {
            let response = try decoder.decode(CollectionResponse<ImgurAlbum>.self, from: jsonData)
            return response.data
        } catch {
            print("decodeImgurJSON failed: \(error.localizedDescription)")
            throw error
        }
    }
    
    func decodeImgurImageJSON(jsonData: Data) -> ImgurImage? {
        let decoder = JSONDecoder()
        do {
            let response = try decoder.decode(APIResponse<ImgurImage>.self, from: jsonData)
            return response.data
        } catch {
            print("Decode Imgur image JSON failed with error: \(error)")
            return nil
        }
    }
}
