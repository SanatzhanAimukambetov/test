//
//  StorageManager.swift
//  ToDoList
//
//  Created by Sanatzhan Aimukambetov on 08.12.2020.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObject(_ item: Item) {
        
        try! realm.write {
            realm.add(item)
        }
    }
    
    static func deleteObject(_ item: Item) {
        
        try! realm.write {
            realm.delete(item)
        }
    }
}
