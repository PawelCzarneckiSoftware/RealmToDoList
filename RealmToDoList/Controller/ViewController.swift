//
//  ViewController.swift
//  RealmToDoList
//
//  Created by Pawel Czarnecki on 15/12/2019.
//  Copyright © 2019 Pawel Czarnecki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let toDoImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "ToDo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button;
    }()
    
    let toDoTextView: UITextView = {
       let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "To Do List", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)])
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    let uiTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    @objc func buttonAction(sender: UIButton!) {
       print("Button tapped")
    }
}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
      return 1
     }
     
     
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 5
     }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath)
       cell.textLabel?.text = "Hello, World"
      
      return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            uiTableView.deleteRows(at: [indexPath], with: .automatic)
      }
    }
}

extension ViewController {
    
    func setupLayout(){
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true

        topImageContainerView.addSubview(toDoImageView)
        topImageContainerView.addSubview(toDoTextView)
        topImageContainerView.addSubview(addButton)
        
        toDoImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        toDoImageView.topAnchor.constraint(equalTo: topImageContainerView.topAnchor, constant: 10).isActive = true
        toDoImageView.widthAnchor.constraint(equalTo: topImageContainerView.widthAnchor, multiplier: 0.6).isActive = true
        toDoImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.6).isActive = true
        
        toDoTextView.topAnchor.constraint(equalTo: toDoImageView.bottomAnchor, constant: 10).isActive = true
        toDoTextView.leftAnchor.constraint(equalTo: topImageContainerView.leftAnchor, constant: 5).isActive = true
        toDoTextView.rightAnchor.constraint(equalTo: topImageContainerView.rightAnchor,constant: 5).isActive = true
    //    toDoTextView.bottomAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 5).isActive = true
        
        addButton.topAnchor.constraint(equalTo: toDoTextView.bottomAnchor, constant: 5).isActive = true
        addButton.bottomAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 0).isActive = true
        
        addButton.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        view.addSubview(uiTableView)
        uiTableView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        uiTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    
        uiTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        uiTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        uiTableView.delegate = self
        uiTableView.dataSource = self
        uiTableView.register(UITableViewCell.self, forCellReuseIdentifier: "id")
    }
}

