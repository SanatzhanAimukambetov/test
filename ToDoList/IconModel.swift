//
//  IconModel.swift
//  ToDoList
//
//  Created by Sanatzhan Aimukambetov on 20.11.2020.
//

import UIKit

struct IconModel {
    var image: UIImage
    
    static func fetchIcons() -> [IconModel] {
        let firstItem = IconModel(image: UIImage(named: "icon1")!)
        let secondItem = IconModel(image: UIImage(named: "icon2")!)
        let thirdItem = IconModel(image: UIImage(named: "icon3")!)
        let four = IconModel(image: UIImage(named: "icon4")!)
        let five = IconModel(image: UIImage(named: "icon5")!)
        let fourthItem = IconModel(image: "icon6")
//        let five = IconModel(image: "icon5")
//        let six = IconModel(image: "icon6")
//        let seven = IconModel(image: "icon7")
//        let eight = IconModel(image: "icon8")
//        let nine = IconModel(image: "icon9")
//        let ten = IconModel(image: "icon10")
        return [firstItem, secondItem, thirdItem, four, five]
//
//        return [firstItem, secondItem, thirdItem, fouthItem, five, six, seven, eight, nine, ten]
    }
}

struct Constants {
    static let leftDistanceToView: CGFloat = 0
    static let rightDistanceToView: CGFloat = 0
    static let galleryMinimumLineSpacing: CGFloat = 10
//    static let galleryItemWidth = (UIScreen.main.bounds.width - Constants.leftDistanceToView - Constants.rightDistanceToView - (Constants.galleryMinimumLineSpacing / 2)) / 2
}
