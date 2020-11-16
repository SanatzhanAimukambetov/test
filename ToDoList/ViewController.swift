//
//  ViewController.swift
//  ToDoList
//
//  Created by Kairat Zukhra on 06.11.2020.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var addNewItemView = addItemView()
    var listOfItems = [Item]()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .gray
    
        self.view.addSubview(addNewItemView)
        setupConstraints()
        addNewItemView.isHidden = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
                                            
    }
    
    // MARK: Adding new item (view appearing)
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        
        show()
        addNewItemView.onAdd = { item in
            self.listOfItems.append(item)
            self.tableView.reloadData()
        }
        
        /*
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
        */
    }
    
    private func show() {
        addNewItemView.snp.removeConstraints()
        addNewItemView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.snp.bottom)
            /*
            $0.height.equalTo(view.snp.height).dividedBy(2)
            */
        }
        self.addNewItemView.isHidden = false
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    // realm
    // carousel
    // design
    // radiusCorner
    // opacity of view
    // sorting by names and deadlines
    // limitation = 10 cells, limitation for textfield
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func setupConstraints() {
        
        addNewItemView.backgroundColor = .black
        addNewItemView.layer.cornerRadius = 10
        addNewItemView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.snp.bottom)
            /*
            make.height.equalTo(view.snp.height).dividedBy(2)
            */
        }
        
        addNewItemView.layer.shadowColor = UIColor.black.cgColor
        addNewItemView.layer.shadowOpacity = 1
        addNewItemView.layer.shadowOffset = .zero
        addNewItemView.layer.shadowRadius = 10
        
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

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainList", for: indexPath) as! CustomTableViewCell
        let item = listOfItems[indexPath.row]
        cell.newItemLabel.text = item.nameItem
        cell.daysLeftLabel.text = item.dateItem!.daysFromNowToString()
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfItems.count
    }
    
}

