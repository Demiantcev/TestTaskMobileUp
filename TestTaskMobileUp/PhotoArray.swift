//
//  PhotoArray.swift
//  TestTaskMobileUp
//
//  Created by Кирилл Демьянцев on 24.04.2023.
//

import Foundation

struct PhotoArray {
    static var photoArray = [PhotoItem]()
    
    func getPhotoArray(_ photoArray: [PhotoItem]) {
        PhotoArray.photoArray = photoArray
    }
}
