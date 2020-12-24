//
//  EditPhotoViewController.swift
//  QuickGifs
//
//  Created by BrysonSaclausa on 12/23/20.
//

import UIKit

class EditPhotoViewController: UIViewController {
    // MARK: - Properties
    let save = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveTapped))
    let selectedImageOrVideoView = UIView()
    let stack = UIStackView()
    let imagePicker = UIImagePickerController()
    fileprivate let filterCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Edit GIF View"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.rightBarButtonItem = save
        filterCollectionView.delegate = self
        filterCollectionView.dataSource = self
        addSubviews()
        configureCollectionView()
        configureImageOrVideoView()
    }
    
    // MARK: - Helper Methods
    func addSubviews() {
        view.addSubview(selectedImageOrVideoView)
        view.addSubview(filterCollectionView)

    }
    
    func configureImageOrVideoView() {
        // Configure
        selectedImageOrVideoView.frame = CGRect(x: 0, y: 200, width: 350, height: 450)
        selectedImageOrVideoView.center.x = view.center.x
        selectedImageOrVideoView.layer.cornerRadius = 10
        selectedImageOrVideoView.clipsToBounds = true
        selectedImageOrVideoView.backgroundColor = .purple
        // Constraints
        selectedImageOrVideoView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        selectedImageOrVideoView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
        selectedImageOrVideoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:0).isActive = true
        selectedImageOrVideoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:0).isActive = true
        selectedImageOrVideoView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        selectedImageOrVideoView.widthAnchor.constraint(equalTo: selectedImageOrVideoView.heightAnchor, multiplier: 1/1).isActive = true
    }
    
    func configureCollectionView() {
        filterCollectionView.backgroundColor = .clear
        filterCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 1).isActive = true
        filterCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        filterCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 1).isActive = true
        filterCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height/7).isActive = true
    }
    
    @objc func saveTapped() {
        print("Save button was tapped!")
    }


}

extension EditPhotoViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3.5, height: collectionView.frame.height/1.15)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .gray
        cell.layer.cornerRadius = 10
       
        return cell
    }

}
