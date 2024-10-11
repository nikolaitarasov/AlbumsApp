//
//  AlbumsListViewModel.swift
//  AlbumsApp
//
//  Created by Nikolai Tarasov on 10/9/24.
//

import Foundation

@MainActor
class AlbumsListViewModel: ObservableObject {
    @Published var albumsList: [Album] = []
    @Published var isError: Bool = false
    @Published var errorMessage: String = ""
    
    func fetchAlbums(for query: String) async {
        do {
            let albumsList = try await NetworkManager.shared.fetchAlbums(query: query)
            self.albumsList = albumsList
        } catch {
            errorMessage = error.localizedDescription
            isError = true
        }
    }
}
