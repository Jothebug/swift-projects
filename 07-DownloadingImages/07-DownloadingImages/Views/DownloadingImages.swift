//
//  DownloadingImages.swift
//  07-DownloadingImages
//
//  Created by HaYen on 3/11/24.
//

import SwiftUI

// Codable
// Background threads
// Weak self
// Combine
// Publishers & Subscribers
// FileManager
// NSCache

struct DownloadingImages: View {
    @EnvironmentObject private var vm: DownloadingImagesViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.dataArray) { model in
                    Text(model.title)
                }
            }
            .navigationTitle("Downloading Images!")
        }
    }
}

#Preview {
    DownloadingImages()
        .environmentObject(DownloadingImagesViewModel())
}
