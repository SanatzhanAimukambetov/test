//
//  GalleryCollectionView.swift
//  ToDoList
//
//  Created by Sanatzhan Aimukambetov on 20.11.2020.
//

import UIKit

class GalleryCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var imageAtIndexPath: ((IndexPath)->())?
    
    var cells = [IconModel]()
    var selectedIndex = IndexPath()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .white
        delegate = self
        dataSource = self
        
        register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: GalleryCollectionViewCell.reuseId)
        
        layout.minimumLineSpacing = Constants.galleryMinimumLineSpacing
        contentInset = UIEdgeInsets(top: 0, left: Constants.leftDistanceToView, bottom: 0, right: Constants.rightDistanceToView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1000000
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.reuseId, for: indexPath) as! GalleryCollectionViewCell
        cell.mainImageView.image = cells[indexPath.row % cells.count].image
        
        if indexPath == selectedIndex {
            cell.layer.borderWidth = 2
            cell.layer.borderColor = ConstantsOfValues.colorOfButton.cgColor
            UIView.animate(withDuration: 0.5) {
                cell.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
            }
        } else {
            cell.layer.borderColor = ConstantsOfValues.colorOfButton.cgColor
            cell.layer.borderWidth = 0
            UIView.animate(withDuration: 0.5) {
                cell.transform = CGAffineTransform.identity
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath
        imageAtIndexPath!(selectedIndex)
        collectionView.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: frame.height)
    }
    
    func set(cells: [IconModel]) {
        self.cells = cells
    }
}
