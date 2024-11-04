//
//  DownloadingImagesRow.swift
//  07-DownloadingImages
//
//  Created by HaYen on 4/11/24.
//

import SwiftUI

struct DownloadingImagesRow: View {
    
    let model: PhotoModel
    
    var body: some View {
        HStack {
            Circle()
                .frame(width: 75, height: 75)
            VStack(alignment: .leading) {
                Text(model.title)
                    .font(.headline)
                Text(model.url)
                    .foregroundColor(.gray)
                    .italic()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }

    }
}

#Preview {
    DownloadingImagesRow(model: PhotoModel(albumId: 1, id: 1, title: "Title", url: "url here", thumbnailUrl: "thumbnail here"))
        .padding()
        .previewLayout(.sizeThatFits)
}