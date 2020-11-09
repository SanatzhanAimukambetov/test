//
//  ViewController.swift
//  ToDoList
//
//  Created by Kairat Zukhra on 06.11.2020.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var listOfItems = [Item]()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfItems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainList", for: indexPath) as! CustomTableViewCell
        
        let item = listOfItems[indexPath.row]
        
        cell.newItemLabel.text = item.nameItem
        cell.daysLeftLabel.text = item.dateItem!.daysFromNowToString()

        return cell
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        
        guard let newItemVC = segue.source as? NewItemTableViewController else { return }
        
        let currentItem = Item(nameItem: newItemVC.itemNameTextField.text, dateItem: newItemVC.datePicker.date)
        
        listOfItems.append(currentItem)
        tableView.reloadData()
    }
    
    // MARK: Adding new item (view appearing)
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        
        let addNewItemView = addItemView()
        
        self.view.addSubview(addNewItemView)
    }
    
    
    // MARK: Deleting item
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        _ = listOfItems[indexPath.row]
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (_, _, _) in self.listOfItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

