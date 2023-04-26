//
//  Model.swift
//  TestTaskMobileUp
//
//  Created by Кирилл Демьянцев on 24.04.2023.
//

import Foundation

struct PhotoResponseWrapped: Decodable {
    let response: PhotoResponse
}

struct PhotoResponse: Decodable {
    var items: [PhotoItems]
}

struct PhotoItems: Decodable {
    var date: Int
    var sizes: [Sizes]
}

struct Sizes: Decodable {
    var url: String
}
