//
//  DataPhoto.swift
//  TestTaskMobileUp
//
//  Created by Кирилл Демьянцев on 26.04.2023.
//

import Foundation

class GetDatePhotos {
    
    private var arrayDate = [Int]()
    private var arrayPhotos = [String]()
    private let networkService = NetworkService()
    
    func getArrays(handler: @escaping ([Int], [String]) -> Void) {
        networkService.request { model in
            for i in model {
                self.arrayDate.append(i.date)
                self.arrayPhotos.append(i.urlPhoto)
            }
            DispatchQueue.main.async {
                handler(self.arrayDate, self.arrayPhotos)
            }
        }
    }
}
