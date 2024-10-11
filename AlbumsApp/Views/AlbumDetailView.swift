//
//  AlbumDetailView.swift
//  AlbumsApp
//
//  Created by Nikolai Tarasov on 10/9/24.
//

import SwiftUI

fileprivate struct SelectedImage: Identifiable {
    var id: UUID = UUID()
    var image: Image
}

struct AlbumDetailView: View {
    @State private var selectedImage: SelectedImage?
    let album: Album
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                ForEach(album.imagesLinks, id: \.self) { imageLink in
                    if let link = URL(string: imageLink) {
                        AsyncImage(url: link) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .onTapGesture {
                                    selectedImage = SelectedImage(image: image)
                                }
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(height: 400)
                    }
                }
                Spacer()
            }
        }
        .toolbar {
            if let title = album.title {
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .foregroundStyle(.white)
                        .font(.title2)
                }
            }
        }
        .padding(.horizontal, 15)
        .toolbarBackground(Color.mint, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .background(
            Image("main-background")
                .resizable()
                .scaledToFill()
                .scrollDisabled(true)
                .edgesIgnoringSafeArea(.bottom)
        )
        .fullScreenCover(item: $selectedImage) { selectedImage in
            FullScreenImageView(selectedImage: selectedImage.image)
        }
    }
}
