//
//  NewView.swift
//  ToDoList
//
//  Created by Sanatzhan Aimukambetov on 20.11.2020.
//

import UIKit
import SnapKit

class NewView: UIView {
    // MARK: Closures
    var onClose: (() -> ())?
    var onAdd: ((_ item: Item) -> ())?
    
    let bottomLine: UIView = {
        let bottomLine = UIView()
        bottomLine.backgroundColor = .gray
        return bottomLine
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        textField.placeholder = "Что хотите сделать?"
        textField.textColor = .black
        textField.borderStyle = .none
        return textField
    }()
    
    let galleryCollectionView = GalleryCollectionView()
    
    let addButton: UIButton = {
        let addButton = UIButton()
        addButton.setTitle("Добавить", for: .normal)
        addButton.setTitleColor(.white, for: .normal)
        addButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 23)
        addButton.backgroundColor = UIColor(red: 0.247, green: 0.5686, blue: 0.2941, alpha: 1)
        addButton.layer.shadowColor = UIColor.black.cgColor
        addButton.layer.shadowOpacity = 0.1
        addButton.layer.shadowRadius = 1
        addButton.layer.masksToBounds = false
        addButton.layer.cornerRadius = 15
        addButton.addTarget(self, action: #selector(add), for: .touchUpInside)
        return addButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        galleryCollectionView.set(cells: IconModel.fetchIcons())
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        setupConstraints()
    }
    
    @objc private func add() {
        
        let item = Item(nameItem: textField.text, imageItem: #imageLiteral(resourceName: "icon4"))
        onAdd?(item)
    }
    
    private func setupViews() {
        addSubview(textField)
        addSubview(bottomLine)
        addSubview(galleryCollectionView)
        addSubview(addButton)
        
    }
    
    private func setupConstraints() {
        
        textField.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(35)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        bottomLine.snp.makeConstraints { (make) in
            make.height.equalTo(1)
            make.top.equalTo(textField.snp.bottom)
            make.leading.trailing.equalTo(textField)
        }
        
        galleryCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(bottomLine.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(100)
        }
        galleryCollectionView.layer.cornerRadius = 15
        galleryCollectionView.layer.borderWidth = 0
        
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
