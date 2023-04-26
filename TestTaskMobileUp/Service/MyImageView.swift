//
//  MyImageView.swift
//  TestTaskMobileUp
//
//  Created by Кирилл Демьянцев on 26.04.2023.
//

import UIKit

class MyImageView: UIImageView {
    
    func set(imageURL: String) {
        guard let url = URL(string: imageURL) else { return }
        
        let tast = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    self!.image = UIImage(data: data)
                }
            }
        }
        tast.resume()
    }
}
