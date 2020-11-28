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
    
    let cellView: UIView = {
        let cell = UIView()
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 10
        return cell
    }()
    
    let itemImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let itemLabel: UILabel = {
        let itemLabel = UILabel()
        itemLabel.text = "Another One"
        return itemLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "MainTableViewCell")
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        addSubview(cellView)
        cellView.addSubview(itemImage)
        cellView.addSubview(itemLabel)
        
        backgroundColor = UIColor(red: 0.247, green: 0.5686, blue: 0.2941, alpha: 1)
    }
    
    private func setupConstraints() {
        
        let heightOfImage = ConstantsOfValues.heightOfCell - 2.5*2 - 20
        
        cellView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.bottom.equalToSuperview().inset(2.5)
        }
        
        itemImage.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(5)
            make.centerY.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(10)
            make.height.width.equalTo(heightOfImage)
        }
        
        itemLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(itemImage.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(15)
        }
    }
}
