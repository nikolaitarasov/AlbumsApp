//
//  ImagesAlbumView.swift
//  AlbumsApp
//
//  Created by Nikolai Tarasov on 10/9/24.
//

import SwiftUI

struct ImageAlbumView: View {
    let url: URL
    let title: String?
    let isFavorite: Bool
    
    var body: some View {
        VStack {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .frame(height: 400)
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            
            HStack {
                if let title {
                    Text(title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.white)
                        .padding()
                }
                Spacer()
                Button {
                    // TODO: Add favorite value updating
                } label: {
                    if isFavorite {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.red)
                    } else {
                        Image(systemName: "heart")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                }
                .buttonStyle(.plain)
                .padding(.trailing, 15)
            }
        }
        .background(Color(uiColor: .systemGray))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.mint, lineWidth: 2))
        .padding(.horizontal, 15)
    }
}

#Preview {
    ImageAlbumView(url: URL(string: "https://i.imgur.com/FkEJImK.jpeg")!,
                   title: "Fun video",
                   isFavorite: true)
}
