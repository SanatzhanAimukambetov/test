//
//  NewItemTableViewController.swift
//  ToDoList
//
//  Created by Kairat Zukhra on 06.11.2020.
//

import UIKit

class NewItemTableViewController: UITableViewController {
    
    @IBOutlet var itemNameTextField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView(frame: CGRect(x: 0,
                                                                                            y: 0,
                                                                                            width: tableView.frame.size.width,
                                                                                            height: 1))
        
        saveButton.isEnabled = false
        itemNameTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    @objc func textFieldChanged() {
        if ((itemNameTextField.text?.isEmpty) != nil) {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
}

extension Date {
    func daysFromNowToString() -> String? {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.month, . day, .hour]
        return formatter.string(from: Date(), to: self)
    }
}
