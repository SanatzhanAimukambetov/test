//
//  ViewController.swift
//  ToDoList
//
//  Created by Kairat Zukhra on 06.11.2020.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var addNewItemView = addItemView()
    var listOfItems = [Item]()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .black
        
        self.view.addSubview(addNewItemView)
        setupView()
        addNewItemView.isHidden = true
        
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
    
    // MARK: Adding new item (view appearing)
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        
        addNewItemView.animShow()
        addNewItemView.onAdd = { item in
            
            self.listOfItems.append(item)
            
            // Reload data
            self.tableView.reloadData()
            /*
            self.tableView.insertRows(at: [IndexPath.init(row: self.listOfItems.count-1, section: 0)], with: .automatic)
            */
            
        }

    }
    
    private func setupView() {
        
        addNewItemView.backgroundColor = .orange
        addNewItemView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.snp.bottom)
            make.height.equalTo(view.snp.height).dividedBy(2)
        }
        
        /*
        addNewItemView.layer.shadowColor = UIColor.black.cgColor
        addNewItemView.layer.shadowOpacity = 1
        addNewItemView.layer.shadowOffset = .zero
        addNewItemView.layer.shadowRadius = 10
        */
        
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

