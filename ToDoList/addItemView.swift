//
//  addItemView.swift
//  ToDoList
//
//  Created by Kairat Zukhra on 09.11.2020.
//

import UIKit

class addItemView: UIView {
    // Closures
    var onClose: (() -> ())?
    var onAdd: ((_ item: Item) -> ())?
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(close), for: .touchUpInside)
        return button
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(add), for: .touchUpInside)
        button.isEnabled = false
        button.setTitleColor(.gray, for: .disabled)
        return button
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: 24)
        textField.returnKeyType = UIReturnKeyType.done
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
    
    @objc private func close() {
        
        hide()
        
    }
    
    @objc private func add() {
        
        let item = Item(nameItem: textField.text, dateItem: datePicker.date)
        onAdd?(item)
        hide()
        
    }
    
    
    private func hide() {
        textField.text = ""
        textField.endEditing(true)
        snp.removeConstraints()
        guard let superView = superview else { return }
        snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(superView.snp.height).dividedBy(2)
            $0.top.equalTo(superView.snp.bottom)
        }
        UIView.animate(withDuration: 0.3) {
            superView.layoutIfNeeded()
        } completion: { (completed) in
            if completed { self.isHidden = true }
        }
    }
    
    private func setupViews() {
        
        addSubview(cancelButton)
        addSubview(addButton)
        addSubview(textField)
        addSubview(datePicker)
        addSubview(carousel)
        textField.delegate = self
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
            make.height.equalTo(30)
            make.top.equalTo(addButton.snp.bottom).offset(10)
        }
        
        datePicker.snp.makeConstraints { (make) in
            make.top.equalTo(textField.snp.bottom).offset(10)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
        }

        carousel.snp.makeConstraints { (make) in
            make.top.equalTo(datePicker.snp.bottom).offset(10)
            make.height.equalTo(40)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.bottom.equalToSuperview().inset(10)
        }
    
    }
    
}

extension addItemView: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        addButton.isEnabled = textField.text?.isEmpty == false ? true : false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
