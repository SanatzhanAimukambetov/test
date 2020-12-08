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
    @objc dynamic var imageItem: Data?
    
    convenience init(nameItem: String, imageItem: Data?) {
        self.init()
        self.nameItem = nameItem
        self.imageItem = imageItem
    }
}
