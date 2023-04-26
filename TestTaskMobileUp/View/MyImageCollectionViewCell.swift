//
//  MyImageCollectionViewCell.swift
//  TestTaskMobileUp
//
//  Created by Кирилл Демьянцев on 26.04.2023.
//

import UIKit

class MyImageCollectionViewCell: UICollectionViewCell {
    
    static var reuzeId = "MyImageCollectionViewCell"
    
    let imageCell: MyImageView = {
       var image = MyImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraint() {
        
        self.addSubview(imageCell)
        NSLayoutConstraint.activate([
            
            imageCell.topAnchor.constraint(equalTo: self.topAnchor),
            imageCell.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageCell.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageCell.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
    }
}
