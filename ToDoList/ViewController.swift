//
//  ViewController.swift
//  ToDoList
//
//  Created by Kairat Zukhra on 06.11.2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var listOfItems = [Item]()
    var currentItem: Item?
    
    @IBOutlet var tableView: UITableView!
    
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        
        guard let newItemVC = segue.source as? NewItemTableViewController else { return }
        
        newItemVC.itemNameTextField.text = currentItem?.nameItem
        newItemVC.datePicker.date = (currentItem?.dateItem)!
        
        listOfItems.append(currentItem!)
        tableView.reloadData()
    }
}

