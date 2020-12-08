//
//  ViewController.swift
//  ToDoList
//
//  Created by Chemdev on 06.11.2020.
//
// realm
// limitation = 10 cells, limitation for textfield

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var buttonIsShow: Bool = true
    var topConstraint: NSLayoutConstraint?
    
    let container: UIView = {
        let container = UIView()
        container.backgroundColor = .clear
        return container
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "addButton4"), for: .normal)
        button.addTarget(self, action: #selector(showOrHide), for: .touchUpInside)
        return button
    }()
    
    let topView = UIView()
    let mainTableView = MainTableView()
    let newView = NewView()
    let hiddenView = UIView()
    var blurView: UIView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        return blurView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        newView.onAdd = { item in
            self.hideView()
            StorageManager.saveObject(item)
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
            }
            self.dismissKeyboard()
        }
        keyboardNotifications()
        mainTableView.separatorColor = .clear
    }

    private func setupConstraints() {
        
        topView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        
        mainTableView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(topView.snp.bottom).offset(5)
        }
        
        container.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()}
        topConstraint = NSLayoutConstraint(item: container, attribute: .top, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -110)
        view.addConstraint(topConstraint!)
        
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
        
        hiddenView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        blurView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    override func viewWillLayoutSubviews() {
        newView.roundCorners(corners: [.topLeft, .topRight], radius: 15)
    }
    
    private func setupViews() {
        
        self.view.addSubview(topView)
        self.view.addSubview(mainTableView)
        self.view.addSubview(blurView)
        self.view.addSubview(hiddenView)
        self.view.addSubview(container)
        self.container.addSubview(addButton)
        self.container.addSubview(newView)
        
        self.view.backgroundColor = ConstantsOfValues.colorOfBackground
        topView.backgroundColor = ConstantsOfValues.colorOfButton
        mainTableView.backgroundColor = .clear
        
        newView.isHidden = true
        hiddenView.isHidden = true
        blurView.isHidden = true
        newView.backgroundColor = .white
        newView.layer.shadowRadius = 100
        
    }
    
    // MARK: Show and hide newView
    @objc private func showOrHide() {
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
        blurView.fadeIn()
        
    }
    
    private func hideView() {
        UIView.animate(withDuration: 0.5, animations: {
            self.container.transform = .identity
            self.addButton.transform = .identity
        }, completion: { (completed) in
            if completed { self.newView.isHidden = true }
        })
        buttonIsShow = true
        blurView.fadeOut()
        newView.textField.text = ""
        
    }
    
    // MARK: Keyboard actions
    private func keyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardNotification), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardNotification), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        hiddenView.addGestureRecognizer(tap)
    }
    @objc private func handleKeyboardNotification(notification: NSNotification) {
        
        if let userInfo = notification.userInfo {
            
            let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            
            let isKeyboardShowing = notification.name == UIResponder.keyboardWillShowNotification
                
            if isKeyboardShowing {
                topConstraint?.constant = -keyboardSize!.height - 90
                hiddenView.isHidden = false
            } else {
                topConstraint?.constant = -110
                hiddenView.isHidden = true
            }
            
            UIView.animate(withDuration: 0, delay: 0, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: { (completed) in

            })

        }
    }
    
    @objc func dismissKeyboard() {
            view.endEditing(true)
        }
}

extension UIView {
    
    func fadeIn(_ duration: TimeInterval? = 0.5, onCompletion: (() -> Void)? = nil) {
        self.alpha = 0
        self.isHidden = false
        UIView.animate(withDuration: duration!,
                       animations: { self.alpha = 1},
                       completion: { (value: Bool) in
                        if let complete = onCompletion { complete() }
        })
    }
    
    func fadeOut(_ duration: TimeInterval? = 0.3, onCompletion: (() -> Void)? = nil) {
        UIView.animate(withDuration: duration!,
                       animations: { self.alpha = 0},
                       completion: { (value: Bool) in
                        self.isHidden = true
                        if let complete = onCompletion { complete() }
        })
    }
}

