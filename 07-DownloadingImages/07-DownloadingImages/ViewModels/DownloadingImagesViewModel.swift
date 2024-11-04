//
//  DownloadingImagesViewModel.swift
//  07-DownloadingImages
//
//  Created by HaYen on 3/11/24.
//

import Foundation
import Combine

class DownloadingImagesViewModel: ObservableObject {
    
    @Published var dataArray: [PhotoModel] = []
    var cancellables = Set<AnyCancellable>()
    let dataService = PhotoModelDataService.instance
    
    init() {
        addSubcribers()
    }
    
    func addSubcribers() {
        dataService.$photoModel
            .sink {[weak self] (returnedPhotoModel) in
                self?.dataArray = returnedPhotoModel
            }
            .store(in: &cancellables)
    }
}
