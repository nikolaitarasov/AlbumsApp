//
//  ContentView.swift
//  AlbumsApp
//
//  Created by Nikolai Tarasov on 10/9/24.
//

import SwiftUI

struct ContentView: View {
    @State private var searchQuery = "funny animals"
    @State private var isSearching = false
    @StateObject var viewModel = AlbumsListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.albumsList.isEmpty {
                    ProgressView {
                        Text("Loading content...")
                            .foregroundStyle(.mint)
                            .bold()
                    }
                        .controlSize(.large)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .tint(.mint)
                } else {
                    ScrollView {
                        LazyVStack {
                            if isSearching {
                                withAnimation {
                                    ProgressView()
                                        .tint(.mint)
                                        .padding()
                                }
                            }
                            ForEach(viewModel.albumsList) { album in
                                if let url = URL(string: album.coverImageURL) {
                                    if url.pathExtension == "mp4" {
                                        VideoAlbumView(url: url,
                                                       title: album.title,
                                                       isFavorite: album.isFavorite)
                                    } else {
                                        NavigationLink(destination: AlbumDetailView(album: album)) {
                                            ImageAlbumView(url: url, 
                                                           title: album.title,
                                                           isFavorite: album.isFavorite)
                                        }
                                    }
                                }
                            }
                            .padding(.vertical, 10)
                        }
                    }
                }
            }
            .toolbarBackground(Color.mint, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .background(
                Image("main-background")
                    .resizable()
                    .scaledToFill()
                    .scrollDisabled(true)
                    .edgesIgnoringSafeArea(.bottom)
            )
            .searchable(text: $searchQuery, prompt: "Search")
            .onSubmit(of: .search) {
                Task {
                    self.isSearching = true
                    await viewModel.fetchAlbums(for: searchQuery)
                    self.isSearching = false
                }
            }
            .refreshable {
                Task {
                    await viewModel.fetchAlbums(for: searchQuery)
                }
            }
            .navigationTitle("Imgur Album Viewer")
            .task {
                guard viewModel.albumsList.isEmpty else { return }
                await viewModel.fetchAlbums(for: searchQuery)
            }
            .alert(viewModel.errorMessage, isPresented: $viewModel.isError) {
                Button("OK", role: .cancel) {}
            }
        }
    }
}

#Preview {
    ContentView()
}
