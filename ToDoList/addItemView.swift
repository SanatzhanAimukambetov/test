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
    
    @objc private func close() {
        
        animHide()
        
    }
    
    @objc private func add() {
        
        let item = Item(nameItem: textField.text, dateItem: datePicker.date)
        onAdd?(item)
        animHide()
        
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

extension UIView {
    
    func animShow() {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [.curveEaseIn, .beginFromCurrentState], animations: {
            self.center.y -= self.bounds.height
            self.layoutIfNeeded()
        }, completion: nil)
        self.isHidden = false
    }
    
    func animHide(){
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [.curveEaseIn, .beginFromCurrentState], animations: {
            self.center.y += self.bounds.height
            self.layoutIfNeeded()
        }, completion: {(_ completed: Bool) -> Void in
            self.isHidden = true
            }
        )
    }
    
}
