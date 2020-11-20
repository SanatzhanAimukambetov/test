//
//  ViewController.swift
//  ToDoList
//
//  Created by Chemdev on 06.11.2020.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var buttonIsShow: Bool = true
    
    let container: UIView = {
        let container = UIView()
        container.backgroundColor = UIColor(white: 0, alpha: 0)
        return container
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "addButton"), for: .normal)
        button.addTarget(self, action: #selector(showOrHide), for: .touchUpInside)
        return button
    }()
    
    let newView = NewView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.247, green: 0.5686, blue: 0.2941, alpha: 1)
        
        setupViews()
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        container.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.snp.bottom).inset(110)
        }
        
        addButton.snp.makeConstraints { (make) in
            make.height.width.equalTo(80)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        newView.snp.makeConstraints { (make) in
            make.height.equalTo(view.snp.height).dividedBy(3)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(addButton.snp.bottom).offset(30)
        }
    }
    
    private func setupViews() {
        
        self.view.addSubview(container)
        self.container.addSubview(addButton)
        self.container.addSubview(newView)
        
        newView.isHidden = true
        newView.backgroundColor = .white
        newView.layer.cornerRadius = 20
        newView.layer.shadowRadius = 100
          
    }
    
    @objc private func showOrHide() {
        if buttonIsShow {
            showView()
        } else {
            hideView()
        }
        buttonIsShow.toggle()
    }
    
    private func showView() {
        self.newView.isHidden = false
        UIView.animate(withDuration: 0.7, animations: {
//            self.view.layoutIfNeeded()
            self.container.transform = CGAffineTransform(translationX: 0, y: -self.newView.bounds.height)
            self.addButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
        })
    }
    
    private func hideView() {
        UIView.animate(withDuration: 0.7, animations: {
            self.container.transform = .identity
            self.addButton.transform = .identity
        }, completion: { (completed) in
            if completed { self.newView.isHidden = true }
        })
    }
}

    
    // MARK: Adding new item (view appearing)
//    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
//
//        show()
//        addNewItemView.onAdd = { item in
//            self.listOfItems.append(item)
//            self.tableView.reloadData()
//        }
//    }
    
//    private func show() {
//        addNewItemView.snp.removeConstraints()
//        addNewItemView.snp.makeConstraints {
//            $0.leading.trailing.equalToSuperview()
//            $0.bottom.equalTo(view.snp.bottom)
//            /*
//            $0.height.equalTo(view.snp.height).dividedBy(2)
//            */
//        }
//        self.addNewItemView.isHidden = false
//        UIView.animate(withDuration: 0.3) {
//            self.view.layoutIfNeeded()
//        }
//    }
    
    // realm
    // carousel
    // design
    // radiusCorner
    // opacity of view
    // sorting by names and deadlines
    // limitation = 10 cells, limitation for textfield
    
    // MARK: Keyboard
//    @objc func keyboardWillShow(notification: NSNotification) {
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            if self.view.frame.origin.y == 0 {
//                self.view.frame.origin.y -= keyboardSize.height
//            }
//        }
//    }
//
//    @objc func keyboardWillHide(notification: NSNotification) {
//        if self.view.frame.origin.y != 0 {
//            self.view.frame.origin.y = 0
//        }
//    }
//
//    @objc func dismissKeyboard() {
//        view.endEditing(true)
//    }
//
//    private func keyboardActions() {
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
//
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
//
//        view.addGestureRecognizer(tap)
//    }
     
//    // MARK: Deleting item
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        _ = listOfItems[indexPath.row]
//        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (_, _, _) in self.listOfItems.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//        }
//
//        return UISwipeActionsConfiguration(actions: [deleteAction])
//    }
    
//
//extension ViewController: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "mainList", for: indexPath) as! CustomTableViewCell
//        let item = listOfItems[indexPath.row]
//        cell.newItemLabel.text = item.nameItem
//        cell.daysLeftLabel.text = item.dateItem!.daysFromNowToString()
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return listOfItems.count
//    }
//
//}
//
//extension Date {
//    func daysFromNowToString() -> String? {
//        let formatter = DateComponentsFormatter()
//        formatter.unitsStyle = .full
//        formatter.allowedUnits = [.month, . day, .hour]
//        return formatter.string(from: Date(), to: self)
//    }
//}

