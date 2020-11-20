//
//  NewView.swift
//  ToDoList
//
//  Created by Sanatzhan Aimukambetov on 20.11.2020.
//

import UIKit
import SnapKit

class NewView: UIView {
    
    let textField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    let galleryCollectionView = GalleryCollectionView()
    
    let addButton: UIButton = {
        let addButton = UIButton()
        return addButton
    }()
    
    private func setupViews() {
        
        addSubview(textField)
        addSubview(galleryCollectionView)
        addSubview(addButton)
    }
    
    private func setupConstraints() {
        
    }

    

}

extension NewView: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        addButton.isEnabled = textField.text?.isEmpty == false ? true : false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
