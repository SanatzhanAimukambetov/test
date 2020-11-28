//
//  ViewController.swift
//  ToDoList
//
//  Created by Chemdev on 06.11.2020.
//
// realm
// carousel
// design
// radiusCorner
// opacity of view
// sorting by names and deadlines
// limitation = 10 cells, limitation for textfield

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
//        button.addTarget(self, action: #selector(addNewItem), for: .touchUpInside)
        return button
    }()
    
    let topView = UIView()
    let mainTableView = MainTableView()
    let newView = NewView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        keyboardActions()
        
        newView.onAdd = { item in
            
            self.hideView()
            self.mainTableView.listOfItems.append(item)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.mainTableView.reloadData()
            }
        }
    }

    private func setupConstraints() {
        
        topView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(80)
        }
        
        mainTableView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(topView.snp.bottom)
        }
        
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
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(addButton.snp.bottom).offset(30)
        }
    }
    
    override func viewWillLayoutSubviews() {
        newView.roundCorners(corners: [.topLeft, .topRight], radius: 15)
    }
    
    private func setupViews() {
        
        self.view.addSubview(topView)
        self.view.addSubview(mainTableView)
        self.view.addSubview(container)
        self.container.addSubview(addButton)
        self.container.addSubview(newView)
        
        topView.backgroundColor = .yellow
        
        mainTableView.backgroundColor = UIColor(red: 0.247, green: 0.5686, blue: 0.2941, alpha: 1)
        
        newView.isHidden = true
        newView.backgroundColor = .white
        newView.layer.shadowRadius = 100
          
    }
    
    @objc private func showOrHide() {
        print(buttonIsShow)
        if buttonIsShow {
            showView()
        } else {
            hideView()
        }
    }
    
    private func showView() {
        self.newView.isHidden = false
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
            self.container.transform = CGAffineTransform(translationX: 0, y: -self.newView.bounds.height)
            self.addButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
        })
        buttonIsShow = false
    }
    
    private func hideView() {
        UIView.animate(withDuration: 0.5, animations: {
            self.container.transform = .identity
            self.addButton.transform = .identity
        }, completion: { (completed) in
            if completed { self.newView.isHidden = true }
        })
        buttonIsShow = true
    }
    
    // MARK: Keyboard actions
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
    
    private func keyboardActions() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
//
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
           view.endEditing(true)
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

