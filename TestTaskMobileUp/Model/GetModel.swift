//
//  GetModel.swift
//  TestTaskMobileUp
//
//  Created by Кирилл Демьянцев on 26.04.2023.
//

import Foundation

struct GetModel {
    let urlPhoto: String
    let date: Int
    
    init(info: PhotoItems) {
        date = info.date
        urlPhoto = info.sizes.last!.url
    }

}
