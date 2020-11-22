//
//  MainTableView.swift
//  ToDoList
//
//  Created by Sanatzhan Aimukambetov on 21.11.2020.
//

import UIKit

class MainTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var listOfItems = [Item]()
    
    init() {
        
        register(MainTableViewCell.self, forCellWithReuseIdentifier: MainTableViewCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainList", for: indexPath) as! MainTableViewCell
        
        let item = listOfItems[indexPath.row]
        
        return cell
    }
    
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

//extension MainTableView: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = dequeueReusableCell(withIdentifier: )
//    }
//}
