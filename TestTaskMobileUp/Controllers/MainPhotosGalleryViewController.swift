//
//  MainPhotosGalleryViewController.swift
//  TestTaskMobileUp
//
//  Created by Кирилл Демьянцев on 26.04.2023.
//

import UIKit
import VK_ios_sdk

class MainPhotosGalleryViewController: UIViewController {
    
    private let networkService = NetworkService()
    private let datePhotos = GetDatePhotos()
    
    private var arrayDate = [Int]()
    private var arrayPhotos = [String]()
    
    static var selectedDate = 0
    static var urlSelectedPhoto: String?
    

    lazy private var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: (view.frame.width - 3)/2, height: 200)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        return layout
    }()
    lazy private var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collection.backgroundColor = .white
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        view.backgroundColor = .secondarySystemBackground
        navigationItem.backButtonTitle = ""
        title = "Mobile Up Gallery"
        let button1 = UIBarButtonItem(title: "Выход", style: .done, target: self, action: #selector(exitVK))
        self.navigationItem.rightBarButtonItem  = button1
        navigationController?.navigationBar.tintColor = .black
        collectionView.register(MyImageCollectionViewCell.self, forCellWithReuseIdentifier: MyImageCollectionViewCell.reuzeId)
        view.addSubview(collectionView)
        getArrays()
    }
}

extension MainPhotosGalleryViewController {
    private func getArrays() {
        networkService.request { model in
            for i in model {
                self.arrayDate.append(i.date)
                self.arrayPhotos.append(i.urlPhoto)
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    @objc
    private func exitVK() {
        self.navigationController?.popToRootViewController(animated: true)
        VKSdk.forceLogout()
    }
}

extension MainPhotosGalleryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayDate.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyImageCollectionViewCell.reuzeId, for: indexPath) as? MyImageCollectionViewCell else {return UICollectionViewCell()}
        cell.imageCell.set(imageURL: arrayPhotos[indexPath.row])
        return cell
    }
    
}
extension MainPhotosGalleryViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let newViewController = DetailPhotoViewController()
        navigationController?.pushViewController(newViewController, animated: true)
        MainPhotosGalleryViewController.selectedDate = arrayDate[indexPath.row]
        MainPhotosGalleryViewController.urlSelectedPhoto = arrayPhotos[indexPath.row]
    }
}
