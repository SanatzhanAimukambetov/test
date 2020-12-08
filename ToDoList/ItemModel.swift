//
//  ItemModel.swift
//  ToDoList
//
//  Created by Chemdev on 06.11.2020.
//

import UIKit
import RealmSwift

class Item: Object {
    
    @objc dynamic var nameItem = ""
    @objc dynamic var imageItem: UIImage?
    
}
