//
//  _7_DownloadingImagesApp.swift
//  07-DownloadingImages
//
//  Created by HaYen on 3/11/24.
// https://jsonplaceholder.typicode.com/photos
//

import SwiftUI

@main
struct _7_DownloadingImagesApp: App {
    @StateObject var vm = DownloadingImagesViewModel()
    var body: some Scene {
        WindowGroup {
            DownloadingImages()
                .environmentObject(vm)
        }
    }
}
