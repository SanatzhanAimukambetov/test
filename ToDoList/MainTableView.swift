//
//  MainTableView.swift
//  ToDoList
//
//  Created by Sanatzhan Aimukambetov on 21.11.2020.
//

import UIKit
import RealmSwift

class MainTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var items: Results<Item>!
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        items = realm.objects(Item.self)
        dataSource = self
        delegate = self
        
        register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.reuseId)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseId, for: indexPath) as! MainTableViewCell
        
        let item = items[indexPath.row]
        
        cell.itemLabel.text = item.nameItem
        cell.itemImage.image = UIImage(data: item.imageItem!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let item = items[indexPath.row]
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { (_, _, _) in
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        deleteAction.backgroundColor = ConstantsOfValues.colorOfButton
        StorageManager.deleteObject(item)
        let swipeConfig = UISwipeActionsConfiguration(actions: [deleteAction])
        return swipeConfig
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ConstantsOfValues.heightOfCell
    }

}

