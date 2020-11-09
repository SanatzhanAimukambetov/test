//
//  addItemView.swift
//  ToDoList
//
//  Created by Kairat Zukhra on 09.11.2020.
//

import UIKit

class addItemView: UIView {
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .highlighted)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        
        button.snp.makeConstraints { (make) in
            make.topMargin.left.equalTo(20)
            make.right.bottomMargin.equalTo(20)
        }
    }
    
}
