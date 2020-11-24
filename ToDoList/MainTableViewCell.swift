//
//  MainTableViewCell.swift
//  ToDoList
//
//  Created by Sanatzhan Aimukambetov on 21.11.2020.
//

import UIKit
import SnapKit

class MainTableViewCell: UITableViewCell {
    
    static let reuseId = "MainTableViewCell"
    
    let itemImage = UIImageView()
    let itemLabel: UILabel = {
        let itemLabel = UILabel()
        itemLabel.text = "Another One"
        return itemLabel
    }()
    
    override class func awakeFromNib() {
        super.awakeFromNib()

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "MainTableViewCell")
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        itemImage.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(5)
            make.top.bottom.equalToSuperview().inset(5)
            make.height.width.equalTo(40)
        }
        
        itemLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(65)
            make.top.bottom.equalTo(10)
            make.trailing.equalToSuperview().inset(15)
        }
    }
}
