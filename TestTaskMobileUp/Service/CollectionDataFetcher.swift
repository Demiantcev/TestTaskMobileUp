//
//  CollectionDataFetcher.swift
//  TestTaskMobileUp
//
//  Created by Кирилл Демьянцев on 24.04.2023.
//

import UIKit

struct CollectionDataFetcher {
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
    
    func fetchPhotos(_ collectionView: UICollectionView) {
        fetcher.getPhotos { photoResponse in
            guard let photoResponse = photoResponse else { return }
            photoArray.getPhotoArray(photoResponse.items)
            collectionView.reloadData()
        }
    }
}
