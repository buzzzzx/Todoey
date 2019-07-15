//
//  ViewController.swift
//  Todoey
//
//  Created by jediii on 2019/7/15.
//  Copyright © 2019 Jediii. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

//    var itemArray = ["Find Mike", "Buy eggs", "Clear home"]
    var itemArray = [Item]()
    
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        var newItem1 = Item()
        newItem1.title = "Buy eggs"
        itemArray.append(newItem1)
        
        var newItem2 = Item()
        newItem2.title = "Clear home"
        itemArray.append(newItem2)
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
        }
    }
    
    // MARK - TableView datasource methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.isChecked ? .checkmark : .none
        
        return cell
    }
    
    
    // MARK - TableView delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath.row)
        itemArray[indexPath.row].isChecked = !itemArray[indexPath.row].isChecked

        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    // MARK - Add New Todo items
    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let addAction = UIAlertAction(title: "Add Item", style: .default) { (action) in
            if let text = textField.text {
                
                let item = Item(title: text, isChecked: false)
                self.itemArray.append(item)
                
                self.defaults.set(self.itemArray, forKey: "TodoListArray")
                
                self.tableView.reloadData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("Cancel")
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }


}

