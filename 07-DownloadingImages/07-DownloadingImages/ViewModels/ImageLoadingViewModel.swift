//
//  ImageLoadingViewModel.swift
//  07-DownloadingImages
//
//  Created by HaYen on 4/11/24.
//

import Foundation
import SwiftUI
import Combine

class ImageLoadingViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    var cancellable = Set<AnyCancellable>()
    let manager = PhotoModelCacheManager.instance
    
    let urlString: String
    let imageKey: String
    
    init(url: String, key: String) {
        urlString = url
        imageKey = key
        downloadImage()
    }
    
    func getImage() {
        if let savedImage = manager.get(key: imageKey) {
            image = savedImage
            print("Getting saved image!")
        } else {
            downloadImage()
            print("Downloading image now!")
        }
    }
    
    func downloadImage() {
        isLoading = true
        guard let url = URL(string: urlString) else {
            isLoading = false
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .map{ UIImage(data: $0.data) }
            .receive(on: DispatchQueue.main)
            .sink {[weak self] (_) in
                self?.isLoading = false
            } receiveValue: {[weak self] (returnedImage) in
                guard
                    let self = self,
                    let image = returnedImage else {return}
                
                self.image = image
                self.manager.add(key: self.imageKey, value: image)
            }
            .store(in: &cancellable)
    }
    
}
