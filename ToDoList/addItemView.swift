//
//  addItemView.swift
//  ToDoList
//
//  Created by Kairat Zukhra on 09.11.2020.
//

import UIKit

class addItemView: UIView {
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        return button
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        return button
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: 24)
        return textField
    }()
    
    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.backgroundColor = .white
        return datePicker
    }()
    
    let carousel: UIView = {
        let carousel = UIView()
        carousel.backgroundColor = .white
        return carousel
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
        
        addSubview(cancelButton)
        addSubview(addButton)
        addSubview(textField)
        addSubview(datePicker)
        addSubview(carousel)
    }
    private func setupConstraints() {
        
        cancelButton.snp.makeConstraints { (make) in
            make.leading.equalTo(10)
            make.top.equalTo(5)
            make.height.equalTo(30)
            make.width.equalTo(70)
        }
        
        addButton.snp.makeConstraints { (make) in
            make.trailing.equalTo(-10)
            make.top.equalTo(5)
            make.height.equalTo(30)
            make.width.equalTo(70)
        }
        
        textField.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.equalTo(45)
        }
        
        datePicker.snp.makeConstraints { (make) in
            make.top.equalTo(85)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.height.equalTo(200)
        }

        carousel.snp.makeConstraints { (make) in
            make.top.equalTo(295)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.height.equalTo(100)
        }
    
    }
    
}
