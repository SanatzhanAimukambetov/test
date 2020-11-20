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
        textField.backgroundColor = .white
        textField.borderStyle = .none
        return textField
    }()
    
    let galleryCollectionView = GalleryCollectionView()
    
    let addButton: UIButton = {
        let addButton = UIButton()
        addButton.setTitle("Добавить", for: .normal)
        addButton.setTitleColor(.white, for: .normal)
        addButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 25)
        addButton.backgroundColor = UIColor(red: 0.247, green: 0.5686, blue: 0.2941, alpha: 1)
        addButton.layer.cornerRadius = 15
        return addButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        addSubview(textField)
        addSubview(galleryCollectionView)
        addSubview(addButton)
        
    }
    
    private func setupConstraints() {
        
        textField.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(35)
            make.leading.equalToSuperview().inset(15)
            make.trailing.equalToSuperview().inset(15)
        }
        
        galleryCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(textField.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(100)
        }
        
        addButton.snp.makeConstraints { (make) in
            make.height.equalTo(60)
            make.top.equalTo(galleryCollectionView.snp.bottom).offset(15)
            make.trailing.leading.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().inset(45)
        }
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
