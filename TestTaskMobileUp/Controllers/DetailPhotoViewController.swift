//
//  DetailPhotoViewController.swift
//  TestTaskMobileUp
//
//  Created by Кирилл Демьянцев on 26.04.2023.
//

import UIKit

class DetailPhotoViewController: UIViewController {
    
    private func dateFormatter(date: Double) -> String {
        let date = Date(timeIntervalSince1970: date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
        return localDate
    }
    
    lazy private var fullScreenPhoto: UIImageView = {
        let image = MyImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        if let selectedPhoto = MainPhotosGalleryViewController.urlSelectedPhoto {
            image.set(imageURL: selectedPhoto)
        } else {
            image.image = UIImage(systemName: "xmark")
        }
        image.contentMode = .scaleAspectFit
        return image
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        let timeResult = dateFormatter(date: Double(MainPhotosGalleryViewController.selectedDate))
        title = timeResult
        navigationController?.navigationBar.tintColor = .black
        let button1 = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .done, target: self, action: #selector(share))
        self.navigationItem.rightBarButtonItem  = button1
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        view.addSubview(fullScreenPhoto)
        
        NSLayoutConstraint.activate([
            fullScreenPhoto.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fullScreenPhoto.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            fullScreenPhoto.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3),
            fullScreenPhoto.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            fullScreenPhoto.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    @objc func share() {
        let shareController = UIActivityViewController(activityItems: [fullScreenPhoto.image as Any], applicationActivities: nil)
        shareController.completionWithItemsHandler = { _, bool, _, _ in
            if bool {
                let alert = UIAlertController(title: "Успешно", message:  "Фотография сохранена!", preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .default)
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
            }
        }
        present(shareController, animated: false, completion: nil)
    }
}
