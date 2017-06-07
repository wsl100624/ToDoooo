//
//  ViewController.swift
//  ToDoooo
//
//  Created by Wang Shilong on 6/6/17.
//  Copyright © 2017 Will Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ToDoDelegate {
    
    @IBOutlet weak var toDoList: UITableView!

    var todos = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDoList.delegate = self
        toDoList.dataSource = self
    }
    
    func addToDo(txt: String) {
        todos.append(txt)
        toDoList.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell")!
        cell.textLabel?.text = todos[indexPath.row]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "enterToDo" {
            if let addDoVC = segue.destination as? AddDooooVC {
                addDoVC.delegate = self
            }
        }
    }

}

