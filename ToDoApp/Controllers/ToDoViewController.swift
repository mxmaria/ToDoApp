//
//  ViewController.swift
//  ToDoApp
//
//  Created by Maria Pecheritsyna on 27.06.2021.
//

import UIKit
import PinLayout

class ToDoViewController: UIViewController {
    
    private let tableView = UITableView()
    
    var itemArray = [ItemModel]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var newItem = ItemModel()
        newItem.title = "asd"
        itemArray.append(newItem)
        
        var newItem2 = ItemModel()
        newItem2.title = "qweqwe"
        itemArray.append(newItem2)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(ToDoTableViewCell.self, forCellReuseIdentifier: "ToDoTableViewCell")
        tableView.backgroundColor = UIColor(red: 253/255, green: 243/255, blue: 255/255, alpha: 1)
        
        view.addSubview(tableView)
        
        let navvc = navigationController
        navvc?.navigationBar.barTintColor = UIColor(red: 96/255, green: 176/255, blue: 216/255, alpha: 1)
        navigationItem.title = "ToDoApp"
        navvc?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddButton))
        navigationItem.rightBarButtonItem?.tintColor = .white
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.pin.all()
        
    }
}

extension ToDoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell", for: indexPath) as? ToDoTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: itemArray[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        tableView.reloadData()
    }
    
    @objc
    private func didTapAddButton() {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new task", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            var newItem = ItemModel()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new task"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

